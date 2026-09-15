Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84078C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bW+iPkrSzo0otQQoBYJMGRZoMXs1UqJR5g1BDpvaw78=; b=gR/9M5977rvZR3oiiHb+/vWezH
	FMQ4+G4dcsHjpSUSsLDDd1Xjq2D8v8rLJCc0h2nPvLHYkFynsKa6+Vup0crwXjbjeVVNQ/fEgocTv
	ih5LvafNFcDYRlNC2kcwTiTDOkFqKcytztR2fhZXf54BvMPSXNxebHb3ixFMuMndb8w0SbBdAQgph
	8kTVLLMOKPRzmc/VogqqMieURO7daMH7MX4EMMobSXbPpl5ouPElkXa1RUYYRr2syIbw6Qz9QzSjW
	6+cboPDnRpko6nmbp+XpHKL96PN0o5ernyXIWw32PKG9itF+tIegLLCNYSaSgiCA8iOU8ZakU850x
	nAFThOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Pgw-00000005oP7-2Gx7;
	Tue, 15 Sep 2026 09:43:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Pgv-00000005oOv-0Mzq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bW+iPkrSzo0otQQoBYJMGRZoMXs1UqJR5g1BDpvaw78=; b=KrVv39S5MDqgpFZl6WPi68qdlS
	svOSjy4s4zgIZLlGeqD1QJP9+Oz0vilDFhDhHCU0Li/973ZDZlfr6ZBJM2nnuctvOS0HsAFRNHxxk
	zKZRIcVtL8MJOyf2R85OIf3GOF4pFhf7acYtXtyBABaAxGTpL/p9XnWSXCSkHKWIKVOf2vfLcps79
	kLnkwotGOunouz17NXCzjr8FuZAfmUWubEciJe8AopqaxmB0g+MW/Ljub+LZ9fN0RvnCsttN74JhZ
	F0Z1YY+jvV9qxAhSb0pxIJu+Wrbk+UNLmLsdFm77jugssuQg1KFaZ4A3qVyv9B13Fd+Oc9KuurIDK
	FMADy6KA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Pgs-00000006ViC-1TM5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:43:04 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48437356d60so44939f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465380; x=1790070180; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bW+iPkrSzo0otQQoBYJMGRZoMXs1UqJR5g1BDpvaw78=;
        b=P03B6F3qnrwnSiyQOmMmlyRu88uWm3JyVqnjVFnHyHwwypOqOIathxGr0vneu20vjj
         ixEXGSsgZmR3lPS3AmKOpluknwXNUOo4Dny86CwVQozhFgWileTG0Zr1IBU6Q2IkO8Wq
         SZDTZe5QMrz6mGQT1kBLMWZIgE1Q3q3ru45XY4tpeVoutW9YFmUedktd6ZkTPKm0tFjU
         m7osvEuSZB41M71Ox1TJdJAGFh7q6x6YBoAnUGkyEQ/YimYB3GDtOYlhrdedRICYfeGZ
         nVJ/UDOfYDivWB5R9gOfFpps6pGed/uuKPCgdHkkpDUy7ym0Z698PvG5MQ32BxceLDJO
         kQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465380; x=1790070180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW+iPkrSzo0otQQoBYJMGRZoMXs1UqJR5g1BDpvaw78=;
        b=Y39zbAEpsURNy7AmyrzQVR6vUcQ4ISHXPwQcH9FQKE7IBiYzvST7yRkxKJmeZIZAkO
         6TSaSxm04LFsLWR5nRBIdUg+PY2VBQx8vMXcflryXXihjQ7Fj1cbOiHi3++9zqVe4zBR
         OY/Ip/CQfta9A/WOW2kKRZ4etcJF3DnUQHdpCMLF07c2xM/nME32S1I0t50oG2MHbQl9
         a91WZqaIwEW76uI9PQYmI8NRTrjq3B/BP4IBvRDmmyqNFueSKPSLmWjGE83q5BXKV7Gx
         P2A4M8I8wcUg2MASv2ImLpJI6f4zsaeECusB4hc4sjEh6j1NeGmzkHqUlo74QutDzOlA
         0HKg==
X-Forwarded-Encrypted: i=1; AKwUvBywTlwJO1J6c1d1KYwNfyA7Z1ua5mXzxAO953etb73vUQZh82L7FFwuA+kN9pjM4qMGF/fZVNX1iucXTAR9+dOI@lists.infradead.org
X-Gm-Message-State: AFuF++m4K0RarKSg/prJZ1+6i4TxWUIjCDgRmbFZGuG3b6zdrZ95tDHc
	TckWron8Khf3Euj5Vqjs5/xKjUICQvbylsluldd1RyLPOc8V0E//miHo
X-Gm-Gg: AYBFou1tPzzaNGqGdymdqFWODmydAq21ZV7RfcUKSBZQSGOKsc863rnD2HTM40Da2MQ
	p7mqGlXOmMiehawNgbY18O49ooqhppDYrjjJygVwRu45fII+uOdPQ+H46cVTblZI7XOE+LGJogi
	a7LzpTpNXIEjnmQK9hQPtkAm1/StBGbMOkYr/KTk297Pn1S3Am1hl4DTbnPHERh0frrM3NN5Oc/
	rrGGAx7yC4aagQaSmkRrmhvCBqCck6mWinK2qGULVzIgz8xa/hdSisioAkWRM9vul2JvlQe+vPu
	L5H9K6Porxt3RTj0A84k/Kxv6CtAjQZzpaiudxg+KfoAJpnu+P9SRRTLxJM64yHH4r1xEQAoiS+
	uD/qqXzrjxnnu1n0n/SscXxy83+B7hxQqey3+fEsUGix4djacgJ+rI6fp+5aiRmi73JloKL4Ogq
	RdaoiT/D009vu0SFmI5XjWoRP2RN71J+ti02zoz8Glyzb0EdPLquNd/FWsbCaxFqPkXEXla1qb
X-Received: by 2002:a05:600d:8651:20b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49e82915984mr584455e9.25.1789465379457;
        Tue, 15 Sep 2026 02:42:59 -0700 (PDT)
Received: from mobilestation ([185.195.191.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef28e6asm49140045e9.1.2026.09.15.02.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:42:59 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:42:55 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: "maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>, 
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, 
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"joabreu@synopsys.com" <joabreu@synopsys.com>, "yi.fang.gan@intel.com" <yi.fang.gan@intel.com>, 
	"jun.ann.lai@intel.com" <jun.ann.lai@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net v4 3/7] net: stmmac: Rework S-VLAN handling
Message-ID: <judv4nfaaapgqpykt5lbnne33mojwqcwvipbxc3xuyc46j424h@cxqtyhepnbpu>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
 <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
 <ybotecadvx2x3ucgqjunv77fuyeaxmwl5tn77fswraztiklrdo@ajhpl4c52hcy>
 <OSCPR01MB12769E621C234C53F33FA88F7D3BA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSCPR01MB12769E621C234C53F33FA88F7D3BA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_104302_508007_9C96050F 
X-CRM114-Status: GOOD (  25.97  )
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

On Tue, Sep 15, 2026 at 09:27:51AM +0000, Ovidiu Panait wrote:
> Hi Joseph,
> 
> > 
> > Hi
> > 
> > On Tue, Sep 08, 2026 at 04:43:05PM +0000, Ovidiu Panait wrote:
> > > The ESVL and DOVLTC bits control S-VLAN tag processing and have
> > > nothing to do with the double VLAN feature, which only provides a way
> > > to process an additional inner VLAN tag. However, the driver code
> > > that handles them always refers to "double VLAN", which is unrelated
> > > and makes the implementation confusing. The driver does not use any
> > > of the inner VLAN tag features, and the networking core does not
> > > support offloads for the inner tag anyway.
> > >
> > > To simplify the logic and to reduce the confusion regarding S-Tag vs
> > > double VLAN handling, drop the is_double logic and add a hw_svlan_en
> > > flag that is set when S-Tag hardware handling is enabled.
> > 
> > I believe I suggested to just change the "double" word to "svlan", and
> > not to drop the respective logic completely. The number of S-VLAN tags
> > added/removed must be still counted, otherwise any subsequent VLAN
> > S-Tag removal will disable S-VLAN processing even if there are S-Tags
> > left added.
> > 
> 
> While working on this I realized we don't actually need to toggle the
> S-VLAN bits on/off whenever a S-VLAN tag is added/removed. We can just
> keep them always set as long as the NETIF_F_HW_VLAN_STAG_RX or
> NETIF_F_HW_VLAN_STAG_FILTER features are advertised.
> 
> This simplified the S-VLAN logic quite a bit, by getting rid of the counting.

and reduces the system security by permitting the packets that
otherwise would be filtered out by the controller if there is no any
S-VLAN tags added. So no. The counting logic here is quite
appropriate(-ish).

-Joseph

> 
> Ovidiu
> 
> > -Joseph
> > 
> > >
> 

