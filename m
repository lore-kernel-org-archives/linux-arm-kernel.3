Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E79ED4A5E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvm5JMTbO2PwD9pqO5FOP0iiRcUW0aGJDw4v+qQ7Hgs=; b=ZPYbY0EUyMB0RVBgQ/Yki87XrA
	QwM5QBjrcobseiofizG6mnhEiC9yQS+nxdl6JTkrgSMOzJngu5JXA27qIjxczvfA8agkV/kncBPvD
	SaDyyMNggT6s3/ANTGgoErSFRrQZITiCc5C5rajfoJ90aphnLd1EhzaosRtDFnb9FNAfVbdolxoFp
	2VIdHTn/t9D0Cv1DzmRS3FCg/ItfaYliwxj+oZldH2TqTQqph8Ss14/ap+12e+nv+7MbB3Ebm3+2y
	2jlHQshZD1drYfJgvzd8irdtfBDbVavb7qu354K3plLEuAMIuEd8nO8xTE3TjvJ3dm8cwOQxJANRZ
	MNfL+6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZUm-0000000DTBI-03w6;
	Fri, 16 Jan 2026 02:23:28 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZUi-0000000DTAX-38uh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 02:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=nvm5JMTbO2PwD9pqO5FOP0iiRcUW0aGJDw4v+qQ7Hgs=; b=S
	pjdbcSjhmP4f78WFmqb3Ye8T+5VUOva5CNbtveO+CyZo8H7o0xWsXtae3831AzRP
	EwzCUy4a4gUsHvugojc5F+6ZBwXDcro//cA0fjlLq0kdZjk1OTKfK4o73/pVRE+9
	C1CA4QVAPfk/1F+uy96QRSEeWoVzy1KTvi2l2IL2iA=
Received: from junan76$163.com ( [182.148.52.15] ) by
 ajax-webmail-wmsvr-40-139 (Coremail) ; Fri, 16 Jan 2026 10:23:07 +0800
 (CST)
X-Originating-IP: [182.148.52.15]
Date: Fri, 16 Jan 2026 10:23:07 +0800 (CST)
From: junan  <junan76@163.com>
To: "Will Deacon" <will@kernel.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aWjm1Fr7vH4iLBFc@willie-the-truck>
References: <20260114013859.498148-2-junan76@163.com>
 <aWjm1Fr7vH4iLBFc@willie-the-truck>
X-NTES-SC: AL_Qu2dCvmYv0kj4SaQYukfn0gRhuY2UMays/0k2YJTc9AFojj92ws6QXJ7OEv309mdLx6PtgaNQjl27OpYf4N1NNPRZEHS+HhxHVDKhD5g7g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5e96ed06.2023.19bc49d15b2.Coremail.junan76@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iygvCgDnRngLoWlpxlBYAA--.42037W
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC9Qsf0GlpoQv69AAA3V
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_182325_225117_EF8D797A 
X-CRM114-Status: UNSURE (   2.42  )
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

QXQgMjAyNi0wMS0xNSAyMTowODozNiwgIldpbGwgRGVhY29uIiA8d2lsbEBrZXJuZWwub3JnPiB3
cm90ZToKCj4+RG9lcyBpdCBoZWxwIGlmIHlvdSBwYXNzIHJvZGF0YT1vZmYgb24gdGhlIGNtZGxp
bmUgaW5zdGVhZD8KCkkgdGVzdGVkIGl0IHdpdGggcWVtdSwgInJvZGF0YT1vZmYiIGFjdHVhbGx5
IHdvcmtzIHdlbGwsIHRoYW5rcyBmb3IgeW91ciB0aW1lIFdpbGwhCgpqdW5hbg==

