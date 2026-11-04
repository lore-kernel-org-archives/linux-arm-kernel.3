Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD0B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=scDzpF+k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IOB/DMG8E0H1LG/g/S6WJ7zKwN49Fb8gn4W1dEispPc=; b=scDzpF+kFpAceH
	lpAFbTTtchrBFaHTq0mdZ5xNrWCyLBTtxy8lUf3bYbBCd+mSlwgwPl7d7zfNFZ5+P1D9T1lv46I8G
	zpBIoHQrhxSjdPYxHd7a6mBohpveeEFNeU8Cr/ruXnCKO49MvkLuOyCnBheysR9+geGakGGWBw6L5
	VPO0O0jn7YdghTi9BwcPF/QdF2oDzLiz3/fED0U26xF5BYTKbAshxEw8xyhXWp9SPAwGZ+IhgGMNu
	DZ3mhl9eRwFjTFg1N7cJzYAVl+Ef6d4pCT21V3dLtuITg+fBbdv67i05JA1qtdBbL43ETDvMJzLSd
	tQf5Z9KG+FpZHXqL3KVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVxM-00000004dem-30Rj;
	Wed, 04 Nov 2026 08:02:52 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVxK-00000004deG-09ts
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:02:51 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5378b281aso2335245ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779369; x=1794384169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOB/DMG8E0H1LG/g/S6WJ7zKwN49Fb8gn4W1dEispPc=;
        b=tpnnvOWUZ2bWQzd3NWs+M3/OFn7wDHZ12p14yELI8Jov5+ULns5msA7FPrKUHcXNpi
         Or+BmO7PNQVB2hQQQl4biXNHZdJsGENhtvy9nPkcvRzNyCcNRROKq99aFaCeVIPkzhy5
         1nFhDVpQo1tYYNfLmHSq2gX+6CPS6SskqEQsmwgpU1iI5sT2SVjzYyRs9CWUG/hfB0VM
         Ds3lzwY3oyRjxnCyana6oNgHHRBncA59JneM5TkwNNOp1uObCJX49GESgsjPsLHnFo61
         iFHV0CndCSGEdi/4QsKBT7Okj95IkqyLaums5T13/hZ9w3JmAgd59zcpM7yOk4IWhLVK
         Inzw==
X-Forwarded-Encrypted: i=1; AKwUvBz00NCC/AX/z0BOrNsQZCulnR90DJ1PmzC6yCJ5F5HlIUIMhHQcnbbLaoi+XheYrr1qsJywy356vMu1hbaPaOWB@lists.infradead.org
X-Gm-Message-State: APuU4Z+e2rUDlFzo+lQsKehk5ZhuV/8fkBSNrggORJRlaZPoIoR8edS1
	9ryFIU1Viw0T2xURgC31HlUTAK74Evllli97YJGbuQpWbhshEFlts17UPKC+E3YO
X-Gm-Gg: AYBFou0IOXBvq7E6foC5BGEHzkez3qQhyuQyBod92npZgO+VNtpyxT0f8+zMwJZfegZ
	3VOMpsxxkFH7M7K4ZVzphZWj9a1E0mJepeIlpgidhmZohVD6N3yefGaArxAzaTez9KOCkeKWXTx
	BG/VmVh3658CYWptFGOVta1iiaH5zyvWQHRKovyx/IduO/XP/1NO8+DW8V2bnv5gMOmN1rsQEos
	69WtKw/W9Fa/wZ9ZoKhcxdLm+pP4Fejsw+uHrc/mYC+m7gv0wJN+ZtOYtDTdQLetCIRdhndZlTd
	s4W1wxO48FHyNTI03RcUhCgXfJzR+GpWoUcFwhpf73WdvXq480RoWpuY6JiiNBCyCv/kli1hyrm
	11BRGKTrsHDS6idPDItkMPWHU18Qzm++fk4zSCGHiMQAS0zFRDz6nP7NrJRXbq7FST6PVAmagv3
	1kw1R9rekET6oEt9/SnuRIkLLb97qmsZVSmVKG8VFS3Ka2Eu0LMU//8NNMGC60yjCxKfsLaCm1B
	CyFuWeBq410CiEKvMp91cr+sLw0jBED6t3MD8p5qivCuXh8jPw0AMXlv/De2yfGo1lQpNlcUoYh
	tIvCw/HRCu5YaV1GShINWyp+zaLLisRX6eV2/gCne+mUOS51KiIrRRfKIECR0ekvG3tMUb9hIHn
	Tv1uPXEWJSHtOK2pwmgQhnamwQtI5wqZOtFwogA+TU1I=
X-Received: by 2002:a17:90b:5350:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3ae896f51damr13388235a91.15.1793779368670;
        Wed, 04 Nov 2026 00:02:48 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5aa69fsm8245538a91.2.2026.11.04.00.02.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:02:46 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36cad25b8b0so572812eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:02:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByZdeuEdrlZsOIknwX8rXcxZyAkM3FiY0sFEbMndUcdflnaeUwr5UqBi20hvjdGVUQRB8qpC4I47pPAQgjQnwPO@lists.infradead.org
X-Received: by 2002:a05:693c:42d3:b0:369:faa2:1fb2 with SMTP id
 5a478bee46e88-36a4236a650mr23219527eec.8.1793779365508; Wed, 04 Nov 2026
 00:02:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev> <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
In-Reply-To: <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:02:34 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4Y3Zgq7OV00LedV=wty-pqR=4t70XgWYTbdfzCeaH-Cg@mail.gmail.com>
X-Gm-Features: AclHuK8VH8JEq69kYaCOOBuUsCrdovmtS3uWzk_R-GaR7GJ1IVUq8iGvFERmNvs
Message-ID: <CAPY4CJ4Y3Zgq7OV00LedV=wty-pqR=4t70XgWYTbdfzCeaH-Cg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: Add the Siflower SF19A2890 glue
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_000250_104334_4E2E4DFA 
X-CRM114-Status: GOOD (  35.27  )
X-Spam-Score: -1.4 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 08:53, Maxime Chevallier wrote:
>> The MAINTAINERS entry that covers these files comes with the MIPS series
>> "MIPS: Add support for the Siflower SF19A2890"; this series applies on
>> its own. That entry is also why checkpatch's question about updating
>> MAINTAINERS for the new files is left unanswered here.
>
> hmm not sure this is the common practice, usually you update MAINTAINERS
> along with the driver introduction. This should be part of this series.

Makes sense, v2 will add a MAINTAINERS entry for the glue and its
binding.

>> - the MAC address from the factory partition, and ethtool reporting the
>>   link with no PCS workaround.
>
> no PCS workaround ? what's that about ?

The OpenWrt driver this is based on set STMMAC_FLAG_HAS_INTEGRATED_PCS,
because the core reports a PCS whose link status doesn't work in RGMII
mode. stmmac now only uses the integrated PCS for SGMII and the flag is
gone, so the glue needs nothing for it. That line was only meant to say
the link is reported correctly without it; I'll word it better in v2.

On Wed, Nov 4, 2026 at 2:59=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi Joseph,
>
> On 11/4/26 08:22, Joseph Telaak via B4 Relay wrote:
> > The Siflower SF19A2890, a MIPS SoC for home routers, has a DesignWare
> > GMAC 3.73a. Its interface type and RGMII clock delays are set in a
> > small configuration block next to its clock and reset manager. This
> > series adds a binding and the glue.
> >
> > The glue is based on Chuanhong Guo's driver, which read the RGMII delay=
s
> > from a factory flash cell in the delay line's own units and always
> > applied them. Here the delays come from rx-internal-delay-ps and
> > tx-internal-delay-ps and are applied only when those are present. The
> > interface type is set through set_phy_intf_sel.
> >
> > The delay line's step is not documented, so I measured it: sweeping
> > each delay register over 0-255 with the link at 1000 Mb/s, the working
> > windows repeat every 145 steps (TX) and 144.5 steps (RX), which is one
> > 8 ns period of the 125 MHz RGMII clock. So a step is about 55 ps. The
> > TX eye is about 3.1 ns wide and the RX eye about 1.75 ns; the delays th=
e
> > bootloader programs, 17 and 10 steps (935 and 550 ps), sit inside both.
> >
> > On the GL.iNet GL-SFT1200 the GMAC is the CPU port of a MaxLinear GSW15=
0
> > switch over RGMII with no delays on the board; the GMAC adds both.
> >
> > The MAINTAINERS entry that covers these files comes with the MIPS serie=
s
> > "MIPS: Add support for the Siflower SF19A2890"; this series applies on
> > its own. That entry is also why checkpatch's question about updating
> > MAINTAINERS for the new files is left unanswered here.
>
> hmm not sure this is the common practice, usually you update MAINTAINERS
> along with the driver introduction. This should be part of this series.
>
> >
> > Tested on a GL-SFT1200 with the GSW150 driver:
> > - each of WAN, LAN 1 and LAN 2 links at 1000 Mb/s full duplex and
> >   passes iperf3 both ways (160-205 Mb/s out, 262-273 Mb/s in, well
> >   under line rate; I have not looked into where the limit is);
> > - 10 GB each way through LAN 1, after which every CRC, alignment,
> >   error, drop, overflow and underflow counter on eth0 and lan1 is 0;
> > - 50 link down/up cycles, after which the link and traffic recover;
> > - the MAC address from the factory partition, and ethtool reporting the
> >   link with no PCS workaround.
>
> no PCS workaround ? what's that about ?
>
> Besides that, nice and simple glue, thanks ! :)
>
> Maxime
>
> >
> > ---
> > Joseph Telaak (2):
> >       dt-bindings: net: Add Siflower SF19A2890 GMAC
> >       net: stmmac: Add Siflower SF19A2890 glue
> >
> >  .../bindings/net/siflower,sf19a2890-gmac.yaml      | 110 +++++++++++++=
+
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-sf19a2890.c  | 158 +++++++++++++=
++++++++
> >  5 files changed, 281 insertions(+)
> > ---
> > base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
> > change-id: 20261102-sf19a2890-gmac-4fb4808f869c
> >
> > Best regards,
> > --
> > Joseph Telaak <joseph@telaak.dev>
>
>

