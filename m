Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90504C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk/TVbQmEdhrRriBBk8oaPcQkjOcMSzkB2nVTddFJcY=; b=0b37cEA/RlnxDuhXKv8JDWdUJx
	muKeq3SUH0rNCg5Jeo9EDSwEPnv5iH8hDrH83Q45FF4po9IG4c0weD5RLK/ioGFAi8fVvtkxZPTTh
	I9VzNJxgL+HMTM2HPm09g3ESt/+i5ponr+spa0qA7Zg/zKr5/qn9Sgalhdo9DEdpNr5OLvcZM8AQw
	rpe4Qel2qQdXMUH+EHJhONI7meV3EVsEXMJUwLSGZFvOyCRKUy9ri3C9NjbHImhFIeMYxRR3gWzH2
	0mtPL+iuiPxxxmAYuyzTl78c5gKXJCvtiL43eo+XAToMytUpdjc+lS04V1G9n0GvmePToyD4iUF9O
	gXwhnlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toLvZ-0000000Dv1c-25mV;
	Sat, 01 Mar 2025 12:26:45 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toLu0-0000000Dust-1DAf;
	Sat, 01 Mar 2025 12:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=OoaYmHX0XxMb3ZGRzqhrOqA+8ik0zFy9oaiXUktOM0A=; b=S
	2wcqCYjrorMjz0J+aoOHGkQMzk1/HZoe378Dg6qq2Bvi3+iWO4pVzMiKlm51zlXM
	NHUpBgtTGvLaityI1KHr6V/hyQNAdurRMt+4Bx9dU4aTL/rde6dix2eCHPFk5te1
	ctQ9plpH2Zi2crBPTys9FKRwmlJtjWsvcS+UNB2Vl8=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Sat, 1 Mar 2025 20:24:34 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 1 Mar 2025 20:24:34 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
	sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
	hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
	robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re:Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <AC3DE87B-64B1-4C34-8E1B-3900E2C53AA3@gmail.com>
References: <20250223113036.74252-1-andyshrk@163.com>
 <AC3DE87B-64B1-4C34-8E1B-3900E2C53AA3@gmail.com>
X-NTES-SC: AL_Qu2fAvSYvkAs4imaYekfmkcVgOw9UcO5v/Qk3oZXOJF8jCHpyAceeXBTHlbv/PCDBDqXkAiHVDdI89xeb5lhU4kMvpw71wI8xCMUqheypabd2w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7b8767fc.3607.19551aa5f74.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgA3X+eD_MJna0JzAA--.55803W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hoDXmfC+twJKAABs2
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_042508_690496_C05B5FCF 
X-CRM114-Status: GOOD (  11.41  )
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

CkhpIFBpb3RyLAoK5ZyoIDIwMjUtMDMtMDEgMDQ6MzA6MzPvvIwiUGlvdHIgT25pc3pjenVrIiA8
cGlvdHIub25pc3pjenVrQGdtYWlsLmNvbT4g5YaZ6YGT77yaCj4KPgo+PiBXaWFkb21vxZvEhyBu
YXBpc2FuYSBwcnpleiBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4gdyBkbml1IDIzIGx1dCAy
MDI1LCBvIGdvZHouIDEyOjMwOgo+PiAKPj4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2st
Y2hpcHMuY29tPgo+PiAKPj4gCj4+IFRoZXJlIGFyZSB0d28gRFcgRFBUWCBiYXNlZCBEaXNwbGF5
UG9ydCBDb250cm9sbGVyIG9uIHJrMzU4OCB3aGljaAo+PiBhcmUgY29tcGxpYW50IHdpdGggdGhl
IERpc3BsYXlQb3J0IFNwZWNpZmljYXRpb24gVmVyc2lvbiAxLjQgd2l0aAo+PiB0aGUgZm9sbG93
aW5nIGZlYXR1cmVzOgo+PiAKPj4gKiBEaXNwbGF5UG9ydCAxLjRhCj4+ICogTWFpbiBMaW5rOiAx
LzIvNCBsYW5lcwo+PiAqIE1haW4gTGluayBTdXBwb3J0IDEuNjJHYnBzLCAyLjdHYnBzLCA1LjRH
YnBzIGFuZCA4LjFHYnBzCj4+ICogQVVYIGNoYW5uZWwgMU1icHMKPj4gKiBTaW5nbGUgU3RyZWFt
IFRyYW5zcG9ydChTU1QpCj4+ICogTXVsdGlzdHJlYW0gVHJhbnNwb3J0IChNU1QpCj4+ICrvga5U
eXBlLUMgc3VwcG9ydCAoYWx0ZXJuYXRlIG1vZGUpCj4+ICogSERDUCAyLjIsIEhEQ1AgMS4zCj4+
ICogU3VwcG9ydHMgdXAgdG8gOC8xMCBiaXRzIHBlciBjb2xvciBjb21wb25lbnQKPj4gKiBTdXBw
b3J0cyBSQkcsIFlDYkNyNDo0OjQsIFlDYkNyNDoyOjIsIFlDYkNyNDoyOjAKPj4gKiBQaXhlbCBj
bG9jayB1cCB0byA1OTRNSHoKPj4gKiBJMlMsIFNQRElGIGF1ZGlvIGludGVyZmFjZQo+PiAKPj4g
VGhlIGN1cnJlbnQgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIHNlcmllcyBvbmx5IHN1cHBvcnRzIGJh
c2ljIGRpc3BsYXkgb3V0cHV0cy4KPj4gSSBjb25kdWN0ZWQgdGVzdHMgaW4gMTA4MHAgYW5kIDRL
QDYwIFlDYkNyNDoyOjAgbW9kZXM7IHRoZSBBTFQvVHlwZS1DIG1vZGUKPj4gaGFzbid0IGJlZW4g
dGVzdGVkIHlldCwgYnV0IEkgc3VzcGVjdCBpdCB3aWxsIGxpa2VseSB3b3JrLiBIRENQIGFuZCBh
dWRpbwo+PiBmZWF0dXJlcyByZW1haW4gdW5pbXBsZW1lbnRlZC4gRm9yIFJLMzU4OCwgaXQncyBv
bmx5IHN1cHBvcnQgU1NULCB3aGlsZSBpbgo+PiB0aGUgdXBjb21pbmcgUkszNTc2LCBpdCBjYW4g
c3VwcG9ydCBNU1Qgb3V0cHV0Lgo+PiAKPgo+QW5keSwKPgo+SXMgdGlzIHNlcmllcyBlbm91Z2gg
dG8gZ2V0IHVzYmMxL2RwMSB3b3JraW5nIGFzIHZpZGVvIG91dHB1dCA/Cj4oYXNzdW1pbmcgaSB3
aWxsIGFkZCBuZWNlc3NhcnkgY29kZSBpbiBkdCkgCj4KPnJvY2s1LWl0eCBoYXMgc2Vjb25kIGhk
bWkgcG9ydCB1c2luZyB1c2JjMS9kcDEgbGFuZXMgMiwzIHRvIHJhNjIwIGRwLT5oZG1pIGNvbnZl
cnRlcgo+Cj5pcyBpdCB3b3J0aCB0byBwbGF5IHdpdGggdGhpcyBvciBpdCBpcyB0b28gZWFybHk/
CgpJIHRoaW5rIHlvdSBjb3VsZCBnaXZlIGl0IGEgdHJ5IGlmIGl0IHVzaW5nIHRoZSBTdGFuZGFy
ZCBEUO+8iG5vbi1BTFQgbW9kZe+8iSBwb3J0IGZvciBvdXRwdXQuIApTaW5jZSBJIGRvbid0IGN1
cnJlbnRseSBoYXZlIGEgZGV2ZWxvcG1lbnQgYm9hcmQgd2l0aCBEUDEgb3V0cHV0IGF2YWlsYWJs
ZSwgSSBoYXZlbid0IGJlZW4KYWJsZSB0byB0ZXN0IGl0IHlldC4gQXMgZm9yIHRoZSBUeXBlLUMg
QWx0ZXJuYXRlIE1vZGUgb3V0cHV0LCBzb21lIHBhdGNoZXMgYXJlIHN0aWxsIHJlcXVpcmVkIApJ
J2xsICBzZW5kIGl0IHdpdGggVjIgdG9tb3Jyb3cgb3IgbmV4dCB3ZWVrLgpGZWVsIGZyZWUgdG8g
bGV0IG1lIGtub3cgaWYgSWYgeW91IGVuY291bnRlciBhbnkgaXNzdWVz44CCCgoKPiAK

