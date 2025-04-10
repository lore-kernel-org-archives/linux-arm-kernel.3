Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE70EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fjabhNZAh84MY2Ye2yT/jYKRYS78Z/TF6DR2MqSU1Q=; b=GlvTU1b/wsRgPSdQHw/JXAc5kr
	GZLzS1sgRT2BnMpqgjj0oboOEAKHZQpwLTN2chklV0Tcg9D8nnjnNM7sRgh9oaLMniFVmzN1tmEEW
	0JApsSrORXd7vknAcFmZuOZsE89ipqg7PBJqHIqZlnGa/gPqXHsZyfDtRpKnhmWp/vio6CN9yWza+
	PbGLEkXTKG+MOwWCHdedSUiNhsPUi0QiOvJzIP+JEfw17owuwhSeuCXDlhZL2zT6p0G2Q4eebI6Qp
	i8y/4JPVzdSSZ+otafVcQpDlVlLKUV1zCdC6XhXeIhIehj7fjDPiZ0+wPAPQ5JSJOBwWVUBd9Xwm/
	F/0ZFEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rKa-0000000AYs8-2WHe;
	Thu, 10 Apr 2025 12:48:32 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r9U-0000000AWWq-0X3I;
	Thu, 10 Apr 2025 12:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=rFnq27x4coNBtZepsly9PbTQ7APl0Mfwznlf1HossBM=; b=J
	zcDa9w2v/7924RpIAuaZDDthRZokXLPF3GAbgzFxH/hFXltPmDjL9xclwJavLX1u
	f7M7PZYDDeCM7Yu9pbFjHfchNb75+KhBgZh4CqJyzxUlt8v0FIFIF+cj51lYFVwG
	2g2zOVJnf7r0t6KgVc3GHDmCPqnFMPWbuBNFIDSemE=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 10 Apr 2025 20:36:07 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 10 Apr 2025 20:36:07 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko.stuebner@cherry.de>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
	dianders@chromium.org, sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com,
	l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Damon Ding" <damon.ding@rock-chips.com>
Subject: Re:[PATCH v8 00/13] Add eDP support for RK3588
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
X-NTES-SC: AL_Qu2fBv6Tt00t4SafbOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCHpwA4HTVlTAlzay/CDBgq2nQiHXjJ+zeFCZZJFRqM7aHKxRR/qKmeJ6RSE2yJXmA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <f83f9e3.ae33.1961fb35185.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgA3f6A3u_dnnVOTAA--.29407W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hErXmf3t3Jj+QAEs9
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_053704_549206_48F3E4DF 
X-CRM114-Status: GOOD (  11.61  )
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

CkhlbGxvIEhlaWtvLAogICBDb3VsZCB5b3UgdGFrZSB0aGlzIHNlcmllcyA/IFRoZXkgaGF2ZSBh
bHJlYWR5IGdvdCB0aGUgbmVjZXNzYXJ5IFItQiBhbmQgQWNrLiAKSSB0aGluayBEYW1vbiBzdGls
bCBoYXMgc29tZSBwYXRjaGVzIGZvciBjb25uZWN0b3IgZGVjb3VwbGluZy4gV2l0aCB0aGlzIHNl
cmllcyBoYXZlIGJlZW4gbWVyZ2VkIGVhcmxpZXIuIApIaXMgbmV3IHBhdGNoZXMgY2FuIGhhdmUg
ZmV3ZXIgZGVwZW5kZW5jaWVzLgogICAgCgpBdCAyMDI1LTAzLTEwIDE4OjQxOjAxLCAiRGFtb24g
RGluZyIgPGRhbW9uLmRpbmdAcm9jay1jaGlwcy5jb20+IHdyb3RlOgo+UGlja2VkIGZyb206Cj5o
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcm9ja2NoaXAvbGlzdC8/
c2VyaWVzPTkzNjkzMgo+Cj5UaGVzZSBwYXRjaHMgaGF2ZSBiZWVuIHRlc3RlZCB3aXRoIGEgMTUz
NngyMDQ4cDYwIGVEUCBwYW5lbCBvbgo+UkszNTg4UyBFVkIxIGJvYXJkLCBhbmQgSERNSSAxMDgw
UC80SyBkaXNwbGF5IGFsc28gaGFzIGJlZW4gdmVyaWZpZWQKPm9uIFJLMzU4OCBFVkIxIGJvYXJk
LiBGdXJ0aGVybW9yZSwgdGhlIGVEUCBkaXNwbGF5IGhhcyBiZWVuIHJlY2hlY2tlZAo+b24gUksz
Mzk5IHNhcHBoaXJlIGV4Y2F2YXRvciBib2FyZC4KPgo+UGF0Y2ggMX4zICAgYXJlIHByZXBhcmF0
aW9ucyBmb3IgdGhlIFJLMzU4OCBlRFAgc3VwcG9ydCBvbiBib3RoIEFuYWxvZ2l4Cj4gICAgICAg
ICAgICBzaWRlLgo+UGF0Y2ggNH44ICAgYXJlIHRvIHN1cHBvcnQgdG8gZ2V0IHBhbmVsIGZyb20g
dGhlIERQIEFVWCBidXMuCj5QYXRjaCA5fjExICBhcmUgdGhlIFJLMzU4OCBBbmFsb2dpeCBEUCBk
cml2ZXIgc3VwcG9ydC4KPlBhdGNoIDEyICAgIGlzIHRoZSBhZGRpdGlvbiBvZiBSSzM1ODggZURQ
MCBub2RlLgo+UGF0Y2ggMTMgICAgaXMgdG8gZW5hYmxlIHRoZSBlRFAwIGRpc3BsYXkgb24gUksz
NTg4UyBFVkIxIGJvYXJkLgo+Cj5EYW1vbiBEaW5nICgxMyk6Cj4gIGRybS9icmlkZ2U6IGFuYWxv
Z2l4X2RwOiBBZGQgaXJxIGZsYWcgSVJRRl9OT19BVVRPRU4gaW5zdGVhZCBvZgo+ICAgIGNhbGxp
bmcgZGlzYWJsZV9pcnEoKQo+ICBkcm0vYnJpZGdlOiBhbmFsb2dpeF9kcDogUmVtb3ZlIENPTkZJ
R19QTSByZWxhdGVkIGNoZWNrIGluCj4gICAgYW5hbG9naXhfZHBfYmluZCgpL2FuYWxvZ2l4X2Rw
X3VuYmluZCgpCj4gIGRybS9icmlkZ2U6IGFuYWxvZ2l4X2RwOiBBZGQgc3VwcG9ydCBmb3IgcGh5
IGNvbmZpZ3VyYXRpb24uCj4gIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByb2NrY2hpcDogYW5hbG9n
aXgtZHA6IEFkZCBzdXBwb3J0IHRvIGdldCBwYW5lbAo+ICAgIGZyb20gdGhlIERQIEFVWCBidXMK
PiAgZHJtL2JyaWRnZTogYW5hbG9naXhfZHA6IFN1cHBvcnQgdG8gZ2V0ICZhbmFsb2dpeF9kcF9k
ZXZpY2UucGxhdF9kYXRhCj4gICAgYW5kICZhbmFsb2dpeF9kcF9kZXZpY2UuYXV4Cj4gIGRybS9i
cmlkZ2U6IGFuYWxvZ2l4X2RwOiBBZGQgc3VwcG9ydCB0byBnZXQgcGFuZWwgZnJvbSB0aGUgRFAg
QVVYIGJ1cwo+ICBkcm0vYnJpZGdlOiBhbmFsb2dpeF9kcDogQWRkIHN1cHBvcnQgZm9yCj4gICAg
JmRybV9kcF9hdXgud2FpdF9ocGRfYXNzZXJ0ZWQoKQo+ICBkcm0vcm9ja2NoaXA6IGFuYWxvZ2l4
X2RwOiBBZGQgc3VwcG9ydCB0byBnZXQgcGFuZWwgZnJvbSB0aGUgRFAgQVVYCj4gICAgYnVzCj4g
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByb2NrY2hpcDogYW5hbG9naXgtZHA6IEFkZCBzdXBwb3J0
IGZvciBSSzM1ODgKPiAgZHJtL2JyaWRnZTogYW5hbG9naXhfZHA6IEFkZCBzdXBwb3J0IGZvciBS
SzM1ODgKPiAgZHJtL3JvY2tjaGlwOiBhbmFsb2dpeF9kcDogQWRkIHN1cHBvcnQgZm9yIFJLMzU4
OAo+ICBhcm02NDogZHRzOiByb2NrY2hpcDogQWRkIGVEUDAgbm9kZSBmb3IgUkszNTg4Cj4gIGFy
bTY0OiBkdHM6IHJvY2tjaGlwOiBFbmFibGUgZURQMCBkaXNwbGF5IG9uIFJLMzU4OFMgRVZCMSBi
b2FyZAo+Cj4gLi4uL3JvY2tjaGlwL3JvY2tjaGlwLGFuYWxvZ2l4LWRwLnlhbWwgICAgICAgIHwg
IDI1ICsrKystCj4gYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1ODgtYmFzZS5kdHNp
IHwgIDI4ICsrKysrCj4gLi4uL2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OHMtZXZiMS12MTAuZHRz
ICAgIHwgIDU1ICsrKysrKysrKysKPiAuLi4vZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9k
cF9jb3JlLmMgICAgfCAgODUgKysrKysrKysrLS0tLS0tCj4gLi4uL2dwdS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4L2FuYWxvZ2l4X2RwX3JlZy5jIHwgIDUyICsrKysrKysrKwo+IGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9LY29uZmlnICAgICAgICAgICAgICB8ICAgMSArCj4gLi4uL2dwdS9kcm0vcm9j
a2NoaXAvYW5hbG9naXhfZHAtcm9ja2NoaXAuYyAgIHwgMTAzICsrKysrKysrKysrKysrKystLQo+
IGluY2x1ZGUvZHJtL2JyaWRnZS9hbmFsb2dpeF9kcC5oICAgICAgICAgICAgICB8ICAgNyArLQo+
IDggZmlsZXMgY2hhbmdlZCwgMzEwIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQo+Cj4t
LSAKPjIuMzQuMQo+Cg==

