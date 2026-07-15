Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576ECC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 02:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvJo62jzo8GEatvtucWOxHpxMBXHaV5+0ux4r3mR61w=; b=To1/OmoW4i038AuGR19zEgfy3F
	HhyeqlE+fWmkXa82286CvkDImRTEYb735xVKtlg1Z98TIghhbL1zWg+lLZsoTda6ssvJ59sYPn9Cw
	xAsoll3lF1apQyW+Aq73z30wqKFc11b5gaVogMP2G3xVqFhdXNZCi0DVItQwm/2BCEeiEtVzqtTw9
	odhAMNC3mmc/aaZyg/FtcsVppVFhYKe1ih+sekBsaD7zTrQxHgW+LPx6HDre+Un6eMHOpa3XjFmf9
	Hq63WRqCHrcDZ3Idna9bTx8/Sq9QYmMn6Bh3t4MLy0nzbVgu7h+XNbBxzYjBTW20790CKiTLc7I3t
	892zcRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjp9y-0000000DbwB-0CeS;
	Wed, 15 Jul 2026 02:15:42 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjp9t-0000000DbvV-3S8Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 02:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=cvJo62jzo8GEatvtucWOxHpxMBXHaV5+0ux4r3mR61w=; b=Y
	2H+oczYwtZRM8xJdVBxNUaZmDL2QDXI14xVVXb6EY4GfR7l+/fir+zus0Wa9Ih9/
	4Wr1uu/+qZOthWa7DOO7nXqsJLWV5SBiLlsVmaUtBJ9q5uG0BwwgeshY+E7fIdSB
	zxEgQbrHN+NO/rv9fn1bDj8+bwZoKsYoDyWgAULxvg=
Received: from xiongwm2026$163.com ( [116.128.244.169] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Wed, 15 Jul 2026 10:15:03 +0800
 (CST)
X-Originating-IP: [116.128.244.169]
Date: Wed, 15 Jul 2026 10:15:03 +0800 (CST)
From: xiongwm2026  <xiongwm2026@163.com>
To: "Robin Murphy" <robin.murphy@arm.com>
Cc: "Pranjal Shrivastava" <praan@google.com>,
	"Will Deacon" <will@kernel.org>, "Joerg Roedel" <joro@8bytes.org>,
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>,
	"Rob Clark" <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re:Re: [PATCH v1 0/4] iommu: Fix device lookup lifetime and probe
 cleanup
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <0e405cb3-1227-4ad2-96ff-aa0db3124381@arm.com>
References: <20260714060930.220277-1-xiongwm2026@163.com>
 <alZCbIIuawpugaQe@google.com>
 <0e405cb3-1227-4ad2-96ff-aa0db3124381@arm.com>
X-NTES-SC: AL_Qu2TBvyTvk8r5SSZYukckk8Ugeg8Xsewsvgh249ec/4EmyzdyAcGXkRiO2PO1vm+DhyhuTyzfwlA7OdxRZVbBl9ZsUbd7u3gDD92HriihQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <78f42e18.1be7.19f638e6201.Coremail.xiongwm2026@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgDn7xwo7VZqYlMeAA--.733W
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbCzQi1RWpW7Sg5eAAA3N
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_191538_327328_415CA9E9 
X-CRM114-Status: GOOD (  18.46  )
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

CgpIaSBQcmFuamFsLCBIaSBSb2JpbiwKCgoKVGhhbmtzIGEgbG90IGZvciB0aGUgY2FyZWZ1bCBy
ZXZpZXcgYW5kIGZvciBjbGFyaWZ5aW5nIHRoZQpyZWZjb3VudCBzZW1hbnRpY3MgaGVyZS4KCgpJ
IHNlZSBJIGNvbmZsYXRlZCB0aGUgZXh0cmEgcmVmZXJlbmNlIHRha2VuIGJ5CmJ1c19maW5kX2Rl
dmljZSooKSB3aXRoIG9iamVjdCBsaWZldGltZS4gUHV0dGluZyB0aGF0CnJlZmVyZW5jZSBhZnRl
ciB0aGUgbG9va3VwIGlzIG1lYW50IHRvIHJlc3RvcmUgdGhlIHByZS1maW5kCmJhbGFuY2U7IGl0
IGRvZXMgbm90IGJ5IGl0c2VsZiBpbXBseSB0aGF0IHRoZSBkZXZpY2UgaXMgZ29uZQpvciB0aGF0
IGxhdGVyIHVzZSBvZiBkcml2ZXIgcHJpdmF0ZSBkYXRhIGlzIGEgdXNlLWFmdGVyLXB1dC4KQXMg
eW91IGJvdGggcG9pbnRlZCBvdXQsIGEgcHV0IHRoYXQgcmVhY2hlcyB6ZXJvIGluc2lkZSBwcm9i
ZQp3b3VsZCBwb2ludCBhdCBhIGRlZXBlciBvd25lcnNoaXAgYnVnIGVsc2V3aGVyZSwgd2hpY2gg
SSBoYXZlCm5vdCBkZW1vbnN0cmF0ZWQuCgoKSSBkbyBub3QgY3VycmVudGx5IGhhdmUgYSBLQVNB
TiByZXBvcnQsIG9vcHMsIG9yIG90aGVyCmZhaWxpbmcgbG9nIHRoYXQgc2hvd3MgYSBjb25jcmV0
ZSBicmVha2FnZSBmb3IgdGhlc2UgcGF0aHMuCkdpdmVuIHRoYXQsIEkgd2lsbCBub3QgcHVyc3Vl
IHRoZSAibG9va3VwIGxpZmV0aW1lIiBmcmFtaW5nCmZ1cnRoZXIgYW5kIHdpbGwgZHJvcCB0aGlz
IHNlcmllcyBhcyBwcm9wb3NlZC4KCgpSb2JpbjogaWYgdXNlZnVsIGFzIGEgZm9sbG93LXVwLCBJ
IGNhbiBzZW5kIGEgc21hbGwgY2xlYW51cAp0aGF0IHJlbW92ZXMgdGhlIG5vdy1yZWR1bmRhbnQg
TlVMTCBjaGVja3MgYWZ0ZXIKMTdkZTNmNWZkZDM1ICgiaW9tbXU6IFJldGlyZSBidXMgb3BzIiks
IHdpdGhvdXQgY2xhaW1pbmcgYQpsaWZldGltZSBmaXguIFBsZWFzZSBsZXQgbWUga25vdyBpZiB5
b3Ugd291bGQgbGlrZSB0aGF0LgoKClRoYW5rcyBhZ2FpbiBmb3IgdGhlIGV4cGxhbmF0aW9uLgoK
CkJlc3QgcmVnYXJkcywKV2VpbWluCgoKQXQgMjAyNi0wNy0xNCAyMzo1Njo1MCwgIlJvYmluIE11
cnBoeSIgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPk9uIDE0LzA3LzIwMjYgMzowNiBw
bSwgUHJhbmphbCBTaHJpdmFzdGF2YSB3cm90ZToKPj4gT24gVHVlLCBKdWwgMTQsIDIwMjYgYXQg
MDI6MDk6MjZQTSArMDgwMCwgd2VpbWluIHhpb25nIHdyb3RlOgo+Pj4gRml4IGEgZmV3IElPTU1V
IGRyaXZlciBsaWZldGltZSBhbmQgZXJyb3ItcGF0aCBpc3N1ZXMgZm91bmQgd2hpbGUKPj4+IGF1
ZGl0aW5nIGZ3bm9kZS1iYXNlZCBkZXZpY2UgbG9va3VwIGFuZCBwcm9iZSBjbGVhbnVwIHBhdGhz
Lgo+Pj4KPj4+IFRoZSBmaXJzdCB0aHJlZSBwYXRjaGVzIGF2b2lkIGRlcml2aW5nIGRyaXZlciBw
cml2YXRlIGRhdGEgYWZ0ZXIKPj4+IGRyb3BwaW5nIHRoZSBkZXZpY2UgcmVmZXJlbmNlIHJldHVy
bmVkIGJ5IGJ1c19maW5kX2RldmljZV9ieV9md25vZGUoKS4KPj4+IFRoZXkgYWxzbyBtYWtlIHRo
ZSBBUk0gU01NVSB2MiBhbmQgVlNJIHByb2JlIHBhdGhzIGZhaWwgY2xlYW5seSB3aGVuIHRoZQo+
Pj4gSU9NTVUgbG9va3VwIGZhaWxzLgo+PiAKPj4gSSdtIG5vdCBzdXJlIGlmIHRoYXQncyByZWFs
bHkgbmVlZGVkPyBBbGwgdGhlc2UgZHJpdmVycyBhcmUgZG9pbmcgaXMKPj4gZHJvcHBpbmcgdGhl
ICJleHRyYSIgcmVmY291bnQgKGluY3JlbWVudGVkIGJ5IGNhbGxpbmcgZmluZF9kZXZpY2UpICBi
YWNrCj4+IHRvIHRoZSBzdGF0ZSAqYmVmb3JlKiB0aGUgZndub2RlIGZ1bmN0aW9uIGNhbGwuIElm
IHlvdSBmaW5kIHRoYXQgdGhpcwo+PiBwdXRfZGV2aWNlIGNhdXNlZCB0aGUgY291bnQgdG8gZHJv
cCB0byAwLCBJIGJlbGlldmUgdGhhdCdzIHRoZSByZWFsCj4+IHByb2JsZW0vYnVnLiBUaGVzZSBm
d25vZGUgZnVuY3Rpb25zIGFyZSB1c3VhbGx5IGNhbGxlZCBpbiBwcm9iZSBhbmQgdGhlCj4+IHJl
ZmNvdW50IHNob3VsZG4ndCBiZSAwIGluc2lkZSBwcm9iZS4KPj4gCj4+IENvdWxkIHlvdSBzaGFy
ZSB5b3VyIG9ic2VydmF0aW9uIC8gZmFpbGluZyBsb2dzIHdoZXJlIHRoaXMgZmFpbHM/IE1heWJl
Cj4+IHNvbWV0aGluZyBlbHNlIGlzIHdyb25nIHdpdGggdGhlIHN5c3RlbT8KPgo+SSBkb24ndCBo
YXZlIGFueSB0cmFjZSBvZiB0aGUgb3JpZ2luYWwgcGF0Y2hlcyAodGhhbmtzLCBNaWNyb3NvZnQu
Li4pIAo+YnV0IGxvb2tpbmcgb24gbG9yZSwgeWVzIHRoZXNlICJsaWZldGltZSIgY29uY2VybnMg
YXJlIHNwdXJpb3VzOyBpdCdzIAo+anVzdCBhIHBhcnRpY3VsYXIgc2l0dWF0aW9uIHdoZXJlIGR1
ZSB0byB0aGUgQVBJLCB0aGUgZHJpdmVycyBhcmUgdGFraW5nIAo+YSBzbGlnaHRseSByb3VuZGFi
b3V0IHJvdXRlIHRvIGxvb2sgdXAgdGhlaXIgb3duIHZhbGlkIGRldmljZSBpbnN0YW5jZS4KPgo+
VGhlIElPTU1VIGRldmljZSBtdXN0IGFscmVhZHkgaGF2ZSBhdCBsZWFzdCBvbmUgaGVsZCByZWZl
cmVuY2UgZnJvbSB3YXkgCj5iYWNrIGluIGl0cyBkZXZpY2VfaW5pdGlhbGlzZSgpLCB3aGljaCB3
aWxsIG5vdCBiZSByZWxlYXNlZCB1bmxlc3MgYW5kIAo+dW50aWwgZGV2aWNlX3VucmVnaXN0ZXIo
KSBpcyBjYWxsZWQgKHdoaWNoIGlzIHByb2JhYmx5IG5ldmVyIGZvciBhIAo+bm9uLWhvdHBsdWdn
YWJsZSBwbGF0Zm9ybSBkZXZpY2Ugb25jZSBpdCBoYXMgYmVlbiBzdWNjZXNzZnVsbHkgY3JlYXRl
ZCkuIAo+SWYgc29tZW9uZSB1bnJlZ2lzdGVyZWQgYSBwbGF0Zm9ybSBkZXZpY2Ugd2hpbGUgaXQg
c3RpbGwgaGFkIGEgZHJpdmVyIAo+Ym91bmQsIG9yIHRoZSBJT01NVSBkcml2ZXIgY291bGQgYmUg
dW5ib3VuZCB3aXRob3V0IHVucmVnaXN0ZXJpbmcgdGhlIAo+aW9tbXVfZGV2aWNlIHRocm91Z2gg
d2hpY2ggaXRzIC0+b2ZfeGxhdGUgb3IgLT5wcm9iZV9kZXZpY2UgY291bGQgYmUgCj5jYWxsZWQs
IHNvIG1hbnkgb3RoZXIgdGhpbmdzIHdvdWxkIGJlIGJsb3dpbmcgdXAgYWxyZWFkeSB0aGF0IHRo
aXMgd291bGQgCj5zdGlsbCBiZSBpcnJlbGV2YW50Lgo+Cj5TaW5jZSAxN2RlM2Y1ZmRkMzUgKCJp
b21tdTogUmV0aXJlIGJ1cyBvcHMiKSB0aGVzZSBsb29rdXBzIHNob3VsZCBhbHNvIAo+bmV2ZXIg
cmV0dXJuIE5VTEwgZm9yIHRoZSBzYW1lIHJlYXNvbnMsIHNvIGRvIGZlZWwgZnJlZSB0byBjbGVh
biB1cCAKPnRob3NlIHJlZHVuZGFudCBjaGVja3MgaWYgaXQgaGVscHMgbWFrZSB0aGluZ3MgYSBi
aXQgY2xlYXJlci4KPgo+VGhhbmtzLAo+Um9iaW4uCg==

