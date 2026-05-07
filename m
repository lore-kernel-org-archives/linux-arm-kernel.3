Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA98ECD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03ETEGQ8LUzEYKaAYfcXw2hfuEQY5oNdSkw/PzgTOLE=; b=nIu/mGssyXuTCOCIR2213rX0tX
	FixmEMKgeXEyzWhWqd2HI0O1ym2TSl3GVk/E/N3dURRm0Refl+Y9O6qztJv1LslLl1aweR5512gAS
	ILzrTidrhYYIIkhZKIQHcsRSGEEsbQRDwit9akLR41d26oFgwKYM+lAEDzvnKl6W4rQ4SVLrNXrWB
	V4h6/8nQPANuImzJkwJb9FdxoxXPjcJh1qviM7kT7Apj9pS8a6PIhtHcEgh5Zs2v7CeWLDTIIms4V
	j16XNeGzgipC118KZtJXCGUAPDOZCX++VGvcujo1Xv/55Xm01wooIyi8Zvy/bEkctFL242CmmRabA
	23GzpDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2HB-00000004RO2-1DA2;
	Thu, 07 May 2026 17:12:41 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2H8-00000004RNY-1AE0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 17:12:39 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-837b39eb078so710227b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 10:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778173956; x=1778778756; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03ETEGQ8LUzEYKaAYfcXw2hfuEQY5oNdSkw/PzgTOLE=;
        b=tU0GNJJcy0yzPFP7twM5VCmmWIQkrfcvvtKzBOrgoWGyQ5oDPrEC2TQpHPC6/uNf8S
         /Pl3IYnkJ8L1ky62Y6GwBSxQZTUNxdXCA40PPh4s9M2bKJzpV+ywTXX/0KTtVowdcGk1
         aG+6CbjIfG9cqMh6uhMI7v8Eiv7PiEYnpHWpqhsBekK/iwVBN0KNeEpki47cceJKHSya
         1t5O+0XiqfwNbpfVKq0W8TJAKLZK5iYG/oHSsX6kBwmz/l/+i4LtjrZub4u3PoMTZTXd
         5xpAp8Zsk7bgmlh4yMhy6pfn9pLDSxYTW8MIzGIQU7d897Q8uGvL0pZvsS4vAJiOTOQv
         QBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173956; x=1778778756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03ETEGQ8LUzEYKaAYfcXw2hfuEQY5oNdSkw/PzgTOLE=;
        b=Cweqtwq/zMxOHUvdPkp94XJ/BdM9cP60DxANVPVU6YEHHeGM6nl9O6oLZDTLxv25Fc
         Dc55G6IDEWNCGcqag/DUzuoQ+FyDmTz/qInNLT/1xRFRyc/5/X2Z/bkVA1x7jlLrVmpF
         io/7EyM3WQNjUqPwCHblz9tzYnGiZvioe3hFnWcYrBdQy2kPkzwzQ2l5tOSndgC559Ui
         W0l0EziDq+STkSfPfyfg+gRRgJZICqYT4+Spjbd3pTMbd0lgbiuuKsu9l6lTU0YbsAdO
         Yc4rlqe06mKws/1ygBu5krULu+oDAHa1ELrMbGNnEuVc4spQsuuVtdeThzNuSi/QZu0d
         V1NQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JHFbqe4MSs9m2+CNGmsfYTueLBbsALS0WoFUmiv2vwQ5BCawIOa21GACUkhRESVhx8gC9ik+z9KYE16sP1lb8@lists.infradead.org
X-Gm-Message-State: AOJu0YzqbzJaW8LEYBzo1AaQhQ4NDOqT1K00TJQMnkOzE5mhfdYJrDab
	tbnGf5jVLGNEMvOFLUSF4BMdHPwq2TcPOCPawxGLn3mJ1pPE+W0pyEwGqRTHgA8wIfc=
X-Gm-Gg: AeBDieuEpS4XzmcYXBhNvL749oHMOB9EE2KaY/36V1NgEG06wUlyQT2nJjRXrExGswi
	AqLTwebymRredj/JCn22XrwpvhTmHry0XaYDnIIvD8tQuGCNJNkEQvgf8VoR9lsvv4oEEiTpSmk
	l3m1Qf97Cu14M1vl1Vg3WfVVRMm8Ogl5/0rs8MD8sF8HGDb7oWc4UFvxR7Nux+vr6um5A18e9rL
	6EtFDDOLXVedXtPwjKCnv8A0oCLSPTWL2tpdDhByVS+b4GOorhIcbHSdlpWtFAYqPzuUa9kJsWC
	41KJUw/TRiSr/ZzXfa09b8FBdR/GpYOmnm9IgCjinV7jOhgBv29mnlCmcm85UJ6tK2IVqQ1ezXO
	1IV60nRSE7m9fzpev5wBuX/xs6lAkInvAkdpzDBUczSXdgVhgNmhhv4I7rczTa6jH+A7LWY79mX
	2xbAY8WbscJU8VAgo4YMQ+QbHJzJ3peXNwi2vK7w==
X-Received: by 2002:a05:6a00:4517:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-83a58a2afc1mr7788068b3a.0.1778173956119;
        Thu, 07 May 2026 10:12:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6605:e5cd:f9b9:d6c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c861esm11874096b3a.30.2026.05.07.10.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:12:35 -0700 (PDT)
Date: Thu, 7 May 2026 11:12:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Beleswar Prasad Padhi <b-padhi@ti.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <afzIABSh1xtMEGbf@p14s>
References: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_101238_347374_9C3824B0 
X-CRM114-Status: GOOD (  59.26  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, May 05, 2026 at 10:46:11AM +0200, Arnaud POULIQUEN wrote:
> Hi Beleswar
> 
> On 5/5/26 07:25, Beleswar Prasad Padhi wrote:
> > Hi Arnaud,
> > 
> > On 04/05/26 22:34, Arnaud POULIQUEN wrote:
> > > Hi Beleswar,
> > > 
> > > On 5/4/26 10:17, Beleswar Prasad Padhi wrote:
> > > 
> > 
> > [...]
> > 
> > > > 
> > > > > 
> > > > > I may have misunderstood your solution. Could you please help me
> > > > > understand your proposal by explaining how you would handle three
> > > > > GPIO ports defined in the DT, considering that the endpoint
> > > > > addresses on the Linux side can be random?
> > > > > If I assume there is a unique endpoint on the remote side,
> > > > > I do not understand how you can match, on the firmware side,
> > > > > the Linux endpoint address to the GPIO port.
> > > > 
> > > > 
> > > > Sure, let me take an example:
> > > > Assumptions: 3 GPIO ports in DT, 3 endpoints in Linux (one per port),
> > > > 1 endpoint in remote (0xd) and 1 rpmsg channel (rpmsg-io)
> > > > 
> > > >          rpmsg {
> > > >            rpmsg-io {
> > > >              #address-cells = <1>;
> > > >              #size-cells = <0>;
> > > > 
> > > >              gpio@25 {
> > > >                compatible = "rpmsg-gpio";
> > > >                reg = <25>;
> > > >                gpio-controller;
> > > >                #gpio-cells = <2>;
> > > >                #interrupt-cells = <2>;
> > > >                interrupt-controller;
> > > >              };
> > > > 
> > > >              gpio@32 {
> > > >                compatible = "rpmsg-gpio";
> > > >                reg = <32>;
> > > >                gpio-controller;
> > > >                #gpio-cells = <2>;
> > > >                #interrupt-cells = <2>;
> > > >                interrupt-controller;
> > > >              };
> > > > 
> > > >              gpio@35 {
> > > >                compatible = "rpmsg-gpio";
> > > >                reg = <35>;
> > > >                gpio-controller;
> > > >                #gpio-cells = <2>;
> > > >                #interrupt-cells = <2>;
> > > >                interrupt-controller;
> > > >              };
> > > >            };
> > > >          };
> > > > 
> > > > Code Flow:
> > > > 1. "rpmsg-io" channel is announced from remote firmware with unique dst
> > > >       ept = 0xd.
> > > > 
> > > > 2. rpmsg_core.c creates the default dynamic local ept for the channel
> > > >       ept = 0x405.
> > > > 
> > > > 3. rpmsg_core.c assigns the allocated addr to rpdev device:
> > > >       rpdev->src = 0x405 and rpdev->dst = 0xd.
> > > > 
> > > > 4. rpmsg_gpio_channel_probe() is triggered. For *each* of the GPIO ports
> > > >       in DT, it will trigger rpmsg_gpiochip_register() which will now:
> > > >          a. Call port->ept = rpmsg_create_ept(rpdev,
> > > >                                                                      rpmsg_gpio_channel_callback,
> > > >                                                                      port,
> > > >                                                                     {rpdev.id.name,
> > > >                                                                      RPMSG_ADDR_ANY,
> > > >                                                                      RPMSG_ADDR_ANY});
> > > >              Ex- port->ept->addr = 0x408
> > > > 
> > > >          b. Prepare a 8-byte message having 2 fields:
> > > >              port->ept->addr (0x408) and port->idx (25)
> > > > 
> > > >          c. Send this message to remote firmware on default channel ept
> > > >              (0x405 -> 0xd) by:
> > > >              rpmsg_send(rpdev->ept, &message, sizeof(message));
> > > > 
> > > >          d. Remote side receives this message and creates a map of the
> > > >              linux_ept_addr to gpio_port. (0x408 <-> 25)
> > > > 
> > > > 5. After this point, any gpio messages sent from Linux from gpio port
> > > >       endpoints (Ex- 0x408) can be decoded at remote side by looking up
> > > >       its map (Ex- map[0x408] = 25).
> > > > 
> > > > 6. Any messages sent from remote to Linux for a particular gpio port can
> > > >       also be decoded at Linux by simply fetching the priv pointer to get
> > > >       the per-port device:
> > > >       struct rpmsg_gpio_port *port = priv;
> > > > 
> > > 
> > > Thanks for the details!
> > > 
> > > To sum up:
> > > - the default endpoint acts as the GPIO controller (0x405),
> > > - one extra Linux endpoint is created per port defined in DT.
> > > 
> > > This should work, but my concerns remain the same:
> > > 
> > >    1) This implementation forces the remote processor to handle a single
> > >       endpoint instead of one endpoint per port. This may add complexity to
> > >       the remote firmware if each port is managed in a separate thread.
> > 
> > 
> > A. Not really, I just chose 1 remote endpoint for this example as you
> >      suggested to. We can scale it for two-way communication via the
> >      get_config message like you suggested below.
> > 
> > B. Isn't it a bad design of the firmware if it is handling 10 gpio ports
> >      in 10 threads? The logic to handle all the ports is the same, only
> >      the parameters (e.g. line number, msg) is different.
> > 
> > > 
> > >    2) Linux, as a consumer, should not expose its capabilities to the remote
> > >       side (in your proposal it enumerates the ports defined in the DT).     In my view, the remote processor should expose its capabilities as the
> > >       provider.
> > 
> > 
> > Agreed on this.
> > 
> > > 
> > >  From my perspective, based on your proposal:
> > >   1) Linux should send a get_config message to the remote proc (0x405 -> 0xD). 2) The remote processor would respond with the list of ports, associated
> > >      with an remote endpoint addresses.
> > 
> > 
> > Agreed, we can scale it for multiple remote endpoints like this.
> > 
> > >   3) Linux would parse the response, compare it with the DT, enable the GPIO
> > >      ports accordingly, creating it local endpoint and associating it with
> > >      the remote endpoint.
> > > Using name service to identify the ports should avoid step 1 & 2 ...
> > 
> > 
> > Yes, but won't that make a lot of hard-codings in the driver?
> > 
> > +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> > +    { .name = "rpmsg-io-25" },
> > +    { .name = "rpmsg-io-32" },
> > +    { .name = "rpmsg-io-35" },
> > +    { },
> > +};
> > 
> > What if tomorrow another vendor decides to add more remoteproc
> > controlled GPIO ports to Linux, they would have to update this struct in
> > the driver everytime. And the port indexes (25/32/35) could also differ
> > between vendors. We should make the driver dynamic i.e. vendor
> > agnostic.
> > 
> > I think querying the remote firmware at runtime (step 1 & 2 above) is a
> > common design pattern and makes the driver vendor agnostic. But feel
> > free to correct me.
> > 
> 
> You are right. My proposal would require a patch in rpmsg-core. The idea of
> allowing a postfix in the compatible string has been discussed before, but,
> if I remember correctly, it was not concluded.
>

I also remember discussing this.  I even reviewed one of Arnaud's patch
and submitted one myself.  This must have been in 2020 and the reason why it
wasn't merged has escaped my memory.
 
> /* rpmsg devices and drivers are matched using the service name */
> static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> 				  const struct rpmsg_device_id *id)
> {
> 	size_t len;
> 
> +	len = strnlen(id->name, RPMSG_NAME_SIZE);
> +	if (len && id->name[len - 1] == '*')
> +		return !strncmp(id->name, rpdev->id.name, len - 1);
> 
> 	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> }
> 
> Then, in rpmsg-gpio, and possibly in other drivers such as rpmsg-tty and
> a future rpmsg-i2c, we could use:
> static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
>     { .name = "rpmsg-io" },
>     { .name = "rpmsg-io-*" },
>     { },
> };

That was my initial approach.  We don't even need an additional "rpmsg-io-*" in
rpmsg_gpio_channel_id_table[].  All we need is:

/* rpmsg devices and drivers are matched using the service name */
static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
                                 const struct rpmsg_device_id *id)
{
 +     size_t len = strnlen(id->name, RPMSG_NAME_SIZE);

 -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0; 
 +     return strncmp(id->name, rpdev->id.name, len) == 0;
}

And let the rpmsg-virtio-gpio driver parse @rpdev->id.name to match with a
GPIO controller in the DT.

> 
> If exact name matching is strongly required, then this proposal would not be
> suitablea.
> 
> A third option would be a combination of both approaches: instantiate the
> device using the same name service from the remote side, as done in
> rpmsg-tty. In that case, a get_config message, or a similar mechanism, would
> also be needed to retrieve the port information from the remote side.
>

I'm not overly fond of a get_config message because it is one more thing we
have to define and maintain. 

Arnaud: is there a get_config message already defined for rpmsg_tty?

Beleswar: Can you provide a link to a virtio device that would use a get_config
message?
 
> Tanmaya also proposed another alternative based on reserved addresses.
> 
> At this point, I suggest letting Mathieu review the discussion and recommend
> the most suitable approach.
> 
> Thanks,
> Arnaud
> 
> > > 
> > > At the end, whatever solution is implemented, my main concern is that the
> > > Linux driver design should, if possible, avoid adding unnecessary complexity
> > > or limitations on the remote side (for instance in openAMP project).
> > 
> > 
> > Yes definitely, I want the same. Feel free to let me know if this does
> > not suit with the OpenAMP project.
> > 
> > Thanks,
> > Beleswar
> > 
> > > 
> > > Thanks,
> > > Arnaud
> > > 
> > > 
> > > > So Linux does not need to send the port idx everytime while sending a
> > > > gpio message anymore.
> > > > 
> > > > Thanks,
> > > > Beleswar
> > > > 
> > > > [...]
> > > > 
> > > 
> 

