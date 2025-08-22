Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfIU0fuoE9yXlwzwCsY58yVMK25YpgK8FBL6dKXlTGM=; b=PoIE3F6SEXYltMmGo8+f+MAtOJ
	ltt/PpCefBGP/rkucJR7BkNYJU6z1M6Wdf+/Hl2EL/Bsx7/a+JibkS/eP8IsiGTnaNLJksnDRrte1
	IpW4KsfDAKhNe9d7G4HYz30kEidfNRtCpiuxHbZzsFjE6HnviwKKNitgyKhiEwpzdlIzOVWt1zCIa
	6govFmNAej+WhG8Gc7NghBQK+ayd7uI9ohFF+GTTNJUn3QbZz2EaN2Vf7FVBMio/guIZD/3ysxinK
	/JBJP/38fYUGL/qfamDckQCL6qTOjjsuRd4m+UAttT5j3s8wubzZj52hkpnYLUhysMPw7Nrf+QcYx
	0Q3Lsjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTd-00000004L36-0Noj;
	Sat, 23 Aug 2025 08:19:54 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upYnt-00000003Sb4-3Eb6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 20:56:08 +0000
DKIM-Signature: a=rsa-sha256; bh=jfIU0fuoE9yXlwzwCsY58yVMK25YpgK8FBL6dKXlTGM=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1755896103; v=1; x=1756328103;
 b=DJQSXnrcX1KtXFD8wN/IsWAeXiCKnnn69GH/KEJ8BExviuHhDhgNduzZ4liRcUICrKbL8W2N
 pO8i7R+txU/wZSYMNRNtNWYFPdDbJ3Z1IIsaRL2ln0OdCUQglEMuQI2pA3Rm91tZPhTiW8OI/vi
 BLgWP8MoT8TQCaiBDXJB2kdBLl28Yt2TL5osaCRM4ZYKKfPB3HarwCjt9pkDDw0L15SQZJZ0qPk
 098W7wjKzHXepBiTHHF3EpS9d9FU3erH5/TcFi58UNKCPONunJkaBtN7rgvvK/VdifKBsAkBghW
 tdwOVaFmp/ScFDObBX+vJ5gMSk5hKIH9+r2X/V5UQGLsQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id b22c5fac; Fri, 22 Aug 2025 22:55:03 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: mmp: Add PXA1908 power domain driver
Date: Fri, 22 Aug 2025 22:55:02 +0200
Message-ID: <6193521.lOV4Wx5bFT@radijator>
In-Reply-To: <CAPDyKFoHWNuSmnN0e=QR73r0Ea-XJogbB8S3K+_=VRovzXL2Sw@mail.gmail.com>
References: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
 <20250821-pxa1908-genpd-v2-3-eba413edd526@dujemihanovic.xyz>
 <CAPDyKFoHWNuSmnN0e=QR73r0Ea-XJogbB8S3K+_=VRovzXL2Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_135606_810193_64ED7589 
X-CRM114-Status: GOOD (  12.00  )
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

On Friday, 22 August 2025 11:36:02 Central European Summer Time Ulf Hansson 
wrote:
> By looking at the implementation of the power-domain code below, it
> seems to me that this code is better maintained within the pmdomain
> subsystem (drivers/pmdomain/pxa perhaps). May I suggest that you move
> it there.
> 
> I guess the easiest way to do this is to export the
> pxa1908_pd_register() function - but you could explore using the
> auxiliary bus too, to instantiate a power-domain driver as an
> auxiliary driver.

The auxiliary bus was exactly what I needed, thanks. As for the path, I think 
drivers/pmdomain/marvell would be a better fit and I'll go with that if you 
don't object.

Regards,
--
Duje



