Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68211C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 02:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5/bn7VFLTPKVaHoanyjExDYS1J5nNKjCLzRIm69R90=; b=fr44km2EfGHKM17O/PVlSEXLkj
	S49Vk+pcLMM1jITLN0MTX2zLKWDwIJDuALkJ1ofcfQk5HcYM65TwPFfaGsVwkAwlZiVxOvrbBeO4L
	9gqXqi8LBZLGeCciszG9mZq+hyOedslIBQW0ppoPnq8Q/zv/nEcC2Rg7mnAuwokEZ8jypKEQ25bZq
	0f/mARAFKic3KD0qlLR1fzcyTurFn/4WQVTqx0l1NKIWpAUlE0i2OwfmaMy9Re8DbygzIi9NMF0n/
	EEN9/eufkurZp017VTsObg9HGWbuiOOGyYLart7ttN/y8l6WErFj9PfYyPNfynCMhhKEJmkcrWJZ0
	9Avx1fhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaPj-0000000AdkE-0D3f;
	Mon, 05 Jan 2026 02:33:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaPh-0000000Adk5-0Txh;
	Mon, 05 Jan 2026 02:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y5/bn7VFLTPKVaHoanyjExDYS1J5nNKjCLzRIm69R90=; b=Za9ue1RhvMn07nMzSDFLoh/plx
	X1raPfqf+g4PgT5J1M3wTW2gjlSzwHErKiDqVKJoBbn1VZZpGJI/x0UdbLC6f8e2hrW0xU+zKUEUm
	od+LaSx4bQh4X7AdsFATRT65ADEi45Krey+AJpbHeTyKnevxyYq2Tc9XppQRREHDY9wACrj6lktkn
	7dy3u2VPcq4m9zrw4SBTpoOyyWl0/TIddVFTZWtPATSiPnrL1F/Q+4WGwYPi94SECw7y9k9rse21c
	mK50xyQvPsphQFA2dR44/uJnWigrdjhJ++DjYLYmv+/R9vpNs7QU+wCumjCzD2DLmQWK0xVF7pNWO
	v9NAUAug==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaPd-00000007WTZ-0qUB;
	Mon, 05 Jan 2026 02:33:43 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6052UpUmA1923969, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1767580251; bh=Y5/bn7VFLTPKVaHoanyjExDYS1J5nNKjCLzRIm69R90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=DFzzrRUQIMbZfynfgMuGy8sSG9luT5oPyW2+9fwOS7EN+1WVww870cw2T3bDtnrkD
	 VtQAHdlV/KndhrIeWqM8D9WrHQw0yEtgNFWJFJnRM7aYXM9xqOJSp9x8x2s5CBJiC6
	 CJfJ2pumYYTjYfpLh6eBwhvRcw4ID5VqdwBbYE/SeX6/jSTbYalPmIn1x0BymcSxgt
	 IlSshTJzpdhOqBkxcio/xGyEKEeOCmzwkfUBZOt0z+Z//xjnty79fEdyZORjbwpLHp
	 YN/2VKL2W8NZh9qjmrOsM31BaQ04swNIdd8znxLsYlg/DFy/yjzY0G8ItCSHiQ6Fs/
	 A8ug9GiYrrTrw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6052UpUmA1923969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jan 2026 10:30:51 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 5 Jan 2026 10:30:50 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 5 Jan 2026 10:30:50 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <eleanor.lin@realtek.com>
CC: <afaerber@suse.de>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <devicetree@vger.kernel.org>, <james.tai@realtek.com>,
        <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <robh@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v3 0/2 RESEND] arm64: dts: Add support for Kent SoC family
Date: Mon, 5 Jan 2026 10:30:50 +0800
Message-ID: <20260105023050.26864-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251215103157.27039-1-eleanor.lin@realtek.com>
References: <20251215103157.27039-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_023341_930613_EEBC4B70 
X-CRM114-Status: UNSURE (   6.01  )
X-CRM114-Notice: Please train this message.
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

Hi all,

Just checking if there are any comments on this? Thanks.

Best regards,
Yu-Chun

