Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE71C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O7Ir2JV9F3FRquanCEG57N9yilLJmRdcXyWCErqjXM=; b=QDOd/u9KARm6SKu0E5A1UbuM2w
	AoWNFhqoMKeGHwkUoegPFnq/SIbE0rnM38CUnv62E4KFbqNlykJnW9fvsU1GrugsCSyOrbyZYZEe8
	vRnkL7Qt/HA1h3igRWfFDv2hZVWKBgkkAbDfuHtAYVgdwMXZe51xRmUywBKxT5c6G6gu7N6fVgOs4
	XQ60GA6XjxsbFEjJad88TER+yYvHN1386mjFqZcG/7YMVuIRka+LLfOoM91MmZeLvbkNiWzgDKahv
	bYBeoJx8NYdw8fw9+hQ+3/qXRdn0I7cveoUSga+rf/xfZDmeosH4KmoevGLBf3tv+yewELaGfcgMa
	AH4Aqg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9HT-00000005nV8-2MSi;
	Sun, 10 Aug 2025 16:52:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9Ex-00000005nLG-0yG3;
	Sun, 10 Aug 2025 16:49:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b78ae64756so426989f8f.2;
        Sun, 10 Aug 2025 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754844585; x=1755449385; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1O7Ir2JV9F3FRquanCEG57N9yilLJmRdcXyWCErqjXM=;
        b=Xu3/xra9fJo5AGKlyAJvsw502GJ1+ex5dVQsXp5L1h9WlibG1Ru25fFS5pkjaEfAxw
         o17rH1kG30ljn8ihavkSl8gdHXecAX+SDGcwFwAGvi9x9xMhDEG7ttRNReiqorP/S0m6
         EMzL0oyPnBQ33hVN3kUDm20LtBTzLYe188+1Dr6NrbCMzoS9adqfVmrD4ZswE5MO0/EZ
         sUv/SwyotroNjl40rJLXoUGXKw1MpX81xhCjjtRPkVAAWeWZh0Xd+KZPz1Bat8FAjOio
         HDQRLzCykmOL3XqiBFZplFk/77a2Fo8vQ5+Da6BvVslw/tUn+h2O1ibatX/BLVz5D2C6
         s5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754844585; x=1755449385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O7Ir2JV9F3FRquanCEG57N9yilLJmRdcXyWCErqjXM=;
        b=eP96vS6f5B3JzazJgUvAcBYoVHpN1y9qQ2iRP4/mqyDg27Bd5CdPTBdIxjeTXtHeF2
         ZhS86g2i08HXhJ/x5UDkmn0S0upDVnWffyehQyp1y2oKfJKp4yUI7ivoPh2PAmSYrO+H
         1Py0GFLX9tF3rbvhg0L7ebJMeF8Jj4j4Cz1zPZvrZbAql/QQw/8dZOoGudTTB88xFbMa
         BU2lETEJRgQ+tzvaMGT0PSS2+PEktXdvMOoh/T6EzBvhGf2WCFyL9ZjNcXYkAHSlFJf4
         FAzT+h0gkUG/AeIwVhxEH3Oefsg8wqeOluNOKUBu4ZLTAvyq5jP7YsK9AEh81GTO1abA
         1mKw==
X-Forwarded-Encrypted: i=1; AJvYcCVblNV5GwYtJQzZ+BtXbW/wz3H04owcXG/GkuOwMXrU7Fyir1cIsffNtq57svgyd/QWAIZoAJIXoDhkPWdODKx/@lists.infradead.org, AJvYcCXi0FA/YutVO4jFlUc19pCrTS4q7U2piABL9SLvWEJgcy8HLXeGQsyxxvZU6ZkdLcACigITJGxxHo68Lv4fG4k=@lists.infradead.org
X-Gm-Message-State: AOJu0YytuSEdJdCwf3znOfUw85gz3NLsuZX05pXWvwKXeJwNOg/vayxq
	vXt3ZlSGyjGcZ2AQfgiV1GaCMXbJKxG7zol7lDUQuXMuVp/MrBAwjl+T
X-Gm-Gg: ASbGncsnzF1a/UpCHBWmPWE1gv5kmq7PHsQ39v8QzbnDcyHBETbCH9Mv3VSxbtUBwZv
	t1eDfBc+7hUBEJM9tbkza3Qh5oGbkjmGjAtAvIPsRBki7ZBVsXfeW/jcPhAhrbRU3thNHLmLI2u
	yvrzfkWo/+e3k6AYeuEH3YTvd2fPeedeS7ALDZK5MPzz88PmO4b7XXkFOwa0OG3mts5KgsUVy4Z
	uGSnWItadkz5y55Q8JGfsSUMJJc8zOLKjmRFl2xjAQ+PlwoQAUdAswtMG/cJN/n5cEKBveXUzDj
	yFa4ig/9PEbi4NuQtgClNjlbGpGnb3Oc69QovwI5VLPJx+4XtMC3UVoP7xyOT0zh3HK/J4QFShc
	jj09qUYsn3eMyYRo=
X-Google-Smtp-Source: AGHT+IF3CiPbtmzEifmcmnCZ6v8i8GbiWTGaqS99ZpLMhFYLskKAThOPIcEoj6BjqGlkH2y/M2FuGw==
X-Received: by 2002:a05:600c:820a:b0:456:1a00:c745 with SMTP id 5b1f17b1804b1-459fd04c3e9mr22165455e9.3.1754844584509;
        Sun, 10 Aug 2025 09:49:44 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:f9ef:f5a3:456e:8480])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bc12csm38395980f8f.28.2025.08.10.09.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 09:49:43 -0700 (PDT)
Date: Sun, 10 Aug 2025 19:49:41 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, jonas@kwiboo.se, alsi@bang-olufsen.dk,
	conor+dt@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, edumazet@google.com, heiko@sntech.de,
	krzk+dt@kernel.org, kuba@kernel.org, linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	pabeni@redhat.com, robh@kernel.org, ziyao@disroot.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to
 Radxa E24C
Message-ID: <20250810164941.4oezju3c4vhnunrx@skbuf>
References: <db1f42c3-c8bb-43ef-a605-12bfc8cd0d46@kwiboo.se>
 <20250810140115.661635-1-amadeus@jmu.edu.cn>
 <1f2f8eda-3056-48bd-9c86-3fb699f043f3@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2f8eda-3056-48bd-9c86-3fb699f043f3@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_094947_270400_8BC0ED64 
X-CRM114-Status: GOOD (  11.77  )
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

On Sun, Aug 10, 2025 at 05:15:59PM +0200, Andrew Lunn wrote:
> Just a guess, but maybe it is a DSA tagger bug? Maybe the user frame
> is a VLAN frame. The tagger is placing the VLAN tag into the DSA
> header, so in effect, the frame is no longer a VLAN frame. But it is
> not calling __vlan_hwaccel_clear_tag() to indicate the skbuf no longer
> needs VLAN processing?

For the original skb to have had a VLAN hwaccel tag, validate_xmit_vlan()
would have had to not push it inside, so vlan_hw_offload_capable() must
have been true for DSA user ports. But we advertise neither the
NETIF_F_HW_VLAN_CTAG_TX nor the NETIF_F_HW_VLAN_STAG_TX netdev feature.
So the VLAN tags in skbs transmitted through DSA user ports should all
be in the skb head.

