Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 22:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lNWx8C2z;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=G7HgGOLV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Py9F/bSvxh5TuUFCn+3sfMZQkcYiuncW2pnLUz7b64o=; b=lNWx8C2zY4Qqbx
	HMLh+Bb2tJFxp3Gkb7VpUm9suYujK4tUrlPSAi1vgFA8/x4seObZmb0xzsFNxi1kGKeVXIzhgxU46
	kttnB8EpRN3ssKe5WSoMa/eOEYN698EEF+KW9GMoYGcxBLJJNG4P/qlJt3zpD4hPwyzmJ7foz/KAY
	yob2o9wYoP8lEND/y2iX8iMremGrwm5m+/65oXzNVGvFcnlI2zZQSr2ykYmeMy0IGCBBavBfjQisM
	vklMdCSnYYCjfL9R2/e01WdX0MOVLA1Dpf2nph441M4scJJbtPxjEEUb4k/WQg4m5ceOK6kiqXLVd
	QobTNr6XMiCUnZbdPWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvYR-0000000CiHt-3HAB;
	Fri, 30 Oct 2026 22:58:35 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvYO-0000000CiHT-30aW;
	Fri, 30 Oct 2026 22:58:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793401106; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=dUPNvvNwdgq2FeEWanmyhO+0zn9XJxxP2cUHJ3QfuP9yfTWP7FluRceh6USw813tdlIUD8es98UDARdg+H28bBVAS0vGG/Q0d6L1bYd0g82FT8HzDVmOr+MTHwtCWv8Bzsqso2MWTBst9jGSugE027RV6isJKIA6CapDtTNd93g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793401106; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Py9F/bSvxh5TuUFCn+3sfMZQkcYiuncW2pnLUz7b64o=; 
	b=GTrazlqIZBeFDjL6iG4zpo+uGue1x327ia33cJl8UkAGsvKSEz7NENXsnGyqQtfAFlSoDp1KBi/AqLJ5UvSmeFRTTRk3u1H1Qy1ibhzXI7YQJxjj9Borr0koAGmnvOsggDdeExRqen6qJG5GA9ALfN2BTDl9KrPAlgV1S42Qvbo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=G7HgGOLVshpH4RsL2+xxDTTGLb1KwycqmIpnrqUP86nQIKOGUKaUO524QX2B2S0Ylwf/E9CVbpAO+sV6cohYzRfMxjhDNKY7wPopVEYWn2kYEXI5Q4+H2N3z/OXVsplZSr1l9/nHTelD0bFVnWrNq7Re/LQZLjZ/NxQuYQEGIdQ=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Py9F/bSvxh5TuUFCn+3sfMZQkcYiuncW2pnLUz7b64o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793401104198250.20342044816562;
	Fri, 30 Oct 2026 23:58:24 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Date: Sat, 31 Oct 2026 01:00:00 +0200
Message-ID: <20261031-helios64-gpu-always-on-1@iav.lv>
In-Reply-To: <1937939.QCnGb9OGeP@phil>
References: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv> <1937939.QCnGb9OGeP@phil>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_155833_050767_789B5DAF 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 20:29:47 +0100, Heiko Stuebner wrote:
> > +		regulator-always-on;
> > +		regulator-boot-on;
>
> both of these should not be needed, as the GPU should control its
> regulator. (always-on and boot-on)

Without them it breaks on this board (v7.3):
- with panfrost not loaded, the regulator core turns vdd_gpu off 30 s
  after boot and the next warm reboot hangs in the DDR init (TPL, DDR
  blob v1.25, at "change freq to 856MHz"), 2 of 2; only removing power
  recovers it. All 119 boots in my console log passed there with the
  rail on.
- panfrost loaded after that: "failed to get ack on domain 'gpu'", the
  GPU stays deferred, since pd_gpu powers up before mali-supply is on.
So I would keep always-on and boot-on, as the other RK3399 boards do.

