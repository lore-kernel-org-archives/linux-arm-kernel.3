Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED747E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9E/E5WdaG5UpoJCBLLOu4O2PJcFjCjuJagVvXEwtPM=; b=F7UbWslvVNs3yHaRaw+hq+KA05
	U30nAXQ5hbcmDDw3x2ndPKwzC3koUe2riVKzbtiFb5TTf0xyc3iUa81GBtP6Xl28G2bixwfOgG1T2
	bu54Xusy0XBxh8bSQ+n2iaOrUO4ozIUF6ueenEwyonoMl24gET6CQPsGD/oXGskrA0NHFAwcDCDwg
	yy2zbCh7W66cYPoC5kBttCLimPMivq6jEDNswo7M5z9xxqn6Soeb9eniLTjA+Sc9O+Dl1SDrtNue8
	17KSmEQSUL/I4XQq4afd/GmLo/In4HUG2BV/eApgZQkkym8ZXtlHUDzp3VCbp3gvzSLC9qj3XAOba
	eWP5RtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7YH-00000004Vu5-3YxL;
	Tue, 07 Jan 2025 11:15:13 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7X5-00000004VfH-1ZQv;
	Tue, 07 Jan 2025 11:14:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so27303038a12.0;
        Tue, 07 Jan 2025 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736248437; x=1736853237; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9E/E5WdaG5UpoJCBLLOu4O2PJcFjCjuJagVvXEwtPM=;
        b=gwVGSETgq9unvYdc1epbyF7x+RL1TEYFz9Y9y9Qy+rii7rekh+wKVau095bCgo21zO
         FMAWT3SqcO2YVRiJHG9ER/OtHdzpmhd++DjbkH1CZXAwc9iULnvH7+eieGz3nVqw2/pU
         oZs8/MjtC7hzwxIp3TQQDffIrJK1rs7SggBJ+EzYxK7AhV3Al3lbpcUjHZCh2VYWWxlE
         70fduhJdJyG6mbR3vZFCWyzpUu+oGKaQkehuvHD79btYLVBNivPfblav4TyWynPluqoS
         wDgGdt++y6IG5xiKDRssc7CsNaJpyzn8A9Kq4u2h45e2RNUCFIkrqbr5shz2VkZkEGlH
         E9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248437; x=1736853237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9E/E5WdaG5UpoJCBLLOu4O2PJcFjCjuJagVvXEwtPM=;
        b=ZUJrDOgEI047si3yd4Sp3j7qiT7CYYSZ/UFQcYxZtcnf695N9VClU8J656352zJhQt
         1B0oY3hlvbnEb68wj+bCeP63zQmSQXQg7GjXVQZiq2fuAdG1r1nB62a+e4JLNUUapWa8
         jggpMNu6qZNPLqhX5vKKQFyMd7JGi+MQazoD6ueJqUCszYSUx2CQXoTg4s3YLK6wPNSY
         FQHfA2AkH3UvFfrKLyiP2v2YD/88BoxU+5gsqIMJ/uti/Rq3xl7Z/g72zMTxDHYwBndT
         8qmIdwjVYKGQhkiLcRLRlQ8dgJ2tykLtqwRI+ZzS2n8+FXaR9xer1vHySnUpR+DnPpDx
         /PAw==
X-Forwarded-Encrypted: i=1; AJvYcCUpKQhZ0pA1kvvZPOx3DeTFSKUX4VcMXc5YfWi9jY2DlUQ0qEHi/ZO1TiY9o7UubTd4gzOSTHEq3aF23ulYRc8=@lists.infradead.org, AJvYcCWY1cRmd/qn0ptZ5brut3roEMORyVIFtX6Kvaf7wjnkqdD7MrnrK0hcgTSzPQ21CdWi7xzcEJqzLQkd43Kt9iKv@lists.infradead.org
X-Gm-Message-State: AOJu0YyfrrRI+8K6PuUAkhSFq7DbSuxMPnJD8Nh8L36NT0WPuuf0t5Vo
	GFztHpWvebadEVc61jTW2djztcykPsDQmu2w+F9zZ9TuQAeOTFu5DjhTq01DqiQEIDhjF2GKj21
	AjTtsmeKcKe6udQbEDq43h8L17zU=
X-Gm-Gg: ASbGnctDNQoUZf1TEUxECG+mX28EI/YxW4gEmddSEXtjrqIkjuhbEIWoI/yIuveZsg2
	Wt0SaItsQUJEeOMvUHX3EgR1Bp1fhF3QtnE1GYw==
X-Google-Smtp-Source: AGHT+IGUW/KivPaqDT8jfIsIOe2JvzgrK1iPNtSEV0SLtUlhQXiILMBCyfvuP0zQQUjJ43RAhpPpPZmm7HFnHQ869Lo=
X-Received: by 2002:a50:858b:0:b0:5d9:b8a:9e08 with SMTP id
 4fb4d7f45d1cf-5d90b8a9feemr13666313a12.16.1736248436820; Tue, 07 Jan 2025
 03:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <5a3e8fda-f9e4-4c2f-847b-93f521b8313b@lunn.ch> <CANAwSgSUuEvJb2Vn58o0i7Soo3jGzM8EYHvDtUTPxRHekCpruA@mail.gmail.com>
 <c94570db-c0af-4d92-935c-5cc242356818@lunn.ch> <CANAwSgQ_gojVxvi_OyHTyTSdzRrno=Yymn0AdEXyTHTgDTyFcA@mail.gmail.com>
 <Z3vGXrUIII4ixNnF@ryzen> <b49e6147-32c6-4239-bdba-72f25ef04a9f@lunn.ch>
In-Reply-To: <b49e6147-32c6-4239-bdba-72f25ef04a9f@lunn.ch>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 7 Jan 2025 16:43:38 +0530
Message-ID: <CANAwSgQqPREeFQisQZXqB52+w+j54Bwq4RMiHf3qUTXmnTxCAw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Andrew Lunn <andrew@lunn.ch>
Cc: Niklas Cassel <cassel@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_031359_410745_AE68AD2B 
X-CRM114-Status: GOOD (  20.91  )
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

Hi Andrewm,

On Mon, 6 Jan 2025 at 19:14, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > As both me an Manivannan said earlier in this thread,
> > PCIe endpoint devices should not be described in device tree
> > (the exception is an FPGA, and when you need to describe devices
> > within the FPGA).
> >
> > So I think that adding a "ethernet-phy" device tree node in this case is
> > wrong (as the Ethernet PHY in this case is integrated in the PCIe connected
> > NIC, and not a discrete component on the SoC).
>
> There are other cases when PCIe devices need a DT node. One is when
> you have an onboard ethernet switch connected to the Ethernet
> device. The switch has to be described in DT, and it needs a phandle
> to the ethernet interface. Hence you need a DT node the phandle points
> to.
>
> You are also making the assumption that the PCIe ethernet interface
> has firmware driving all its subsystems. Which results in every PCIe
> ethernet device manufacture re-inventing what Linux can already do for
> SoC style Ethernet interfaces which do not have firmware, linux drives
> it all. I personally would prefer Linux to drive the hardware, via a
> DT node, since i then don't have to deal with firmware bugs i cannot
> fix, its just Linux all the way down.
>
>         Andrew
Ok Thanks for clarifying.

I was just trying to understand the call trace for mdio bus which got
me confused.

[0] https://lore.kernel.org/all/Z3fKkTSFFcU9gQLg@ryzen/

Thanks
-Anand

