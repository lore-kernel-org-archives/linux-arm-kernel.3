Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28974C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcrRTFRj7cbA3cpW+akyQcrb2vmEVONwi8WALRjHB+0=; b=hOKtgjPwtNXCMtBGCxAbLWrfgv
	PpGLaHnpPzgsf5qrmnmaNS2A0Q2BNqciIMGdZhUGEZHAeSYVvB3/FxFiY14KNl1Mpm6duPEnm5C/4
	kSiUvH4zEB5jrE7o+DWFHlXFYMvKRsO5g3J/IvnuMjFHc7B+PNwzSKMmI3KglAcTCVV8TsYmPmJMo
	tE9JXu5BiHfCbHwgvPVpFifP40HZwGSMGTN2TTEBPdLBMtNbru+OULMcu1fDT1CGLwpNze7E9TeL3
	xTyjvKZn9lpVRSNCUF+TCyubPIxFkulq6mHdWD82/HueUgtHTfsxiK6cBFCwJwm1oyFv7BEb1EaDC
	CL/Mt7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOMY-00000006wLo-009b;
	Mon, 11 Aug 2025 08:58:38 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNxK-00000006rZV-31AQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 08:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=l1urE0nBnDldGpR9OuYBitZPOtsyzKvkEwXiA4ekwMM=; b=G
	tL+qPC+Kg8n+h86joVxD5ZB6slCWg485ACImQ9z5pGDNZYK/M0EQRUdlWmcYIXMI
	C8GcJD5Wj3NqgR0hi2UQ9ekhpbUQ+thsQ8m33IT0jo7OspJESkbZNmAJ3wSlyK+Y
	btjwar6go+J71wJeDHfXbd+hLj/y8O+/9U2NRhGFss=
Received: from fanqincui$163.com ( [124.127.58.139] ) by
 ajax-webmail-wmsvr-40-122 (Coremail) ; Mon, 11 Aug 2025 16:32:19 +0800
 (CST)
X-Originating-IP: [124.127.58.139]
Date: Mon, 11 Aug 2025 16:32:19 +0800 (CST)
From: fanqincui  <fanqincui@163.com>
To: "Marc Zyngier" <maz@kernel.org>
Cc: "Will Deacon" <will@kernel.org>, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Fanqin Cui" <cuifq1@chinatelecom.cn>, hanht2@chinatelecom.cn
Subject: Re:Re: [PATCH] arm64/module: Support for patching modules during
 runtime
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <86zfc68exk.wl-maz@kernel.org>
References: <20250807072700.348514-1-fanqincui@163.com>
 <aJXlegQfZTdimS3k@willie-the-truck>
 <3d4011c0.6aaa.198981027d7.Coremail.fanqincui@163.com>
 <86zfc68exk.wl-maz@kernel.org>
X-NTES-SC: AL_Qu2eBvWbvkko7ySZYekXk0wWhOw8Xcexv/0h1IBfPZ00qSTB2TA5dm57NHfH3PmCFgymoQmxeTRT5MtCc5tocb9SQY8C8S+4PR1z5JAFrE/O
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <587b3c08.7e85.19898424fdb.Coremail.fanqincui@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eigvCgD3n5+TqploqnoXAA--.18653W
X-CM-SenderInfo: 5idq1xpqfxxqqrwthudrp/1tbiOhWmpWiZnRfSwwAEsC
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_013235_109558_A37DAAF6 
X-CRM114-Status: UNSURE (   8.15  )
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

CkhpIG1hcmMsClRoZSBjYWxsYmFjayBmdW5jdGlvbiBpcyBkZXNpZ25lZCBieSB0aGUgZGV2ZWxv
cGVyLiBEZXZlbG9wZXJzIG5lZWQKdG8gdXNlIHRoZSBjYWxsYmFjayBmdW5jdGlvbiB0byBwYXRj
aCB0aGVpciBvd24gbW9kdWxlIGNvZGUuIFVuZGVyCnRoaXMgcHJlbWlzZSwgZGV2ZWxvcGVycyBh
cmUgcmVzcG9uc2libGUgZm9yIHByb3ZpZGluZyB0aGUgY29ycmVjdApjYWxsYmFjayBmdW5jdGlv
bi4KQSBjb3JyZWN0IGNhbGxiYWNrIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGRvZXMgbm90IHJl
cXVpcmUgZnVydGhlcgpwYXRjaGluZy4gRnVydGhlcm1vcmUsIHRoZSBjYWxsYmFjayBpdHNlbGYg
bXVzdCBiZSBleGVjdXRhYmxlLiBJZiB0aGUKY2FsbGJhY2sgZnVuY3Rpb24gaGFzIHByb2JsZW1z
LCB0aGUgbW9kdWxlJ3MgZnVuY3Rpb25hbGl0eSB3aWxsIGJlIGFmZmVjdGVkLgoKRmFucWluCgoK
CgoKCgoKCgoKCkF0wqAyMDI1LTA4LTExwqAxNjowMTo0MyzCoCJNYXJjwqBaeW5naWVyIsKgPG1h
ekBrZXJuZWwub3JnPsKgd3JvdGU6Cj5PbsKgTW9uLMKgMTHCoEF1Z8KgMjAyNcKgMDg6Mzc6MzLC
oCswMTAwLAo+ZmFucWluY3VpwqA8ZmFucWluY3VpQDE2My5jb20+wqB3cm90ZToKPj7CoAo+PsKg
SGnCoHdpbGwsCj4+wqBZZXMswqB5b3XCoGFyZcKgcmlnaHQuwqBUaGXCoGFsdGVybmF0aXZlwqBj
YWxsYmFja8KgZnVuY3Rpb27CoGxpdmVzwqBpbnNpZGXCoHRoZcKgbW9kdWxlLgo+PsKgVGhpc8Kg
Y2FsbGJhY2vCoGZ1bmN0aW9uwqBpc8KgYWN0dWFsbHnCoHNpbWlsYXLCoHRvwqBrdm1fdXBkYXRl
X3ZhX21hc2vCoGluwqBLVk07Cj4+wqAKPj7CoFRoZcKgbW9kdWxlJ3PCoGNhbGxiYWNrwqBmdW5j
dGlvbsKgY2FsY3VsYXRlc8Kgc29tZcKgdmFsdWVzwqBiYXNlZMKgb24KPj7CoHRoZcKgY3VycmVu
dMKgQ1BVwqBmZWF0dXJlc8KgYW5kwqB0aGVuwqBwZXJmb3Jtc8KgdGhlwqByZXBsYWNlbWVudC4K
Pj7CoAo+PsKgVGhlwqAudGV4dC5hbHRlcm5hdGl2ZV9jYsKgc2VjdGlvbsKgaXPCoGFjdHVhbGx5
wqBtYXJrZWTCoGFzwqBTSEZfRVhFQ0lOU1RSwqB8wqBTSEZfQUxMT0MKPj7CoGR1cmluZ8KgY29t
cGlsYXRpb24swqBzb8KgaW50ZXJzZWN0aW9ucygpwqBpbmNsdWRlc8KgdGhpc8Kgc2VjdGlvbsKg
YW5kwqBzZXRzwqBpdMKgYXPCoGV4ZWN1dGFibGXCoGxhdGVyLgo+Cj5JJ23CoHdvcnJpZWTCoHRo
ZXJlwqBpc8KgYcKgY2hpY2tlbi1hbmQtZWdnwqBwcm9ibGVtwqBoZXJlLsKgV2hhdMKgaWbCoHRo
ZQo+Y2FsbGJhY2vCoGl0c2VsZsKgcmVxdWlyZXPCoHBhdGNoaW5nwqB2aWHCoHNvbWXCoG90aGVy
wqBhbHRlcm5hdGl2ZT/CoElzwqB0aGVyZQo+YcKgZ3VhcmFudGVlwqB0aGF0wqB0aGlzwqBhbHdh
eXPCoHBlcmZvcm1lZMKgaW7CoHRoZcKgY29ycmVjdMKgb3JkZXI/Cj4KPglNLgo+Cj4tLcKgCj5X
aXRob3V0wqBkZXZpYXRpb27CoGZyb23CoHRoZcKgbm9ybSzCoHByb2dyZXNzwqBpc8Kgbm90wqBw
b3NzaWJsZS4K

