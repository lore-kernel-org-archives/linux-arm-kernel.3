Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D81EC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kW5psOKXL08k2xjnCfKHJRyKMqOYwQuQkKHDbEr+HFA=; b=BwBoOAhDT6mEPKBg9rx2kS0JtH
	8uf6ra/ohtcRTcjVvP5NlgHrroQuS+t9LMDBx1MUCVyGk0YWU1LPtlbK0lRPx5UHmqjybkok/qTd0
	gqzNYSb2YkIU50u+MEIQchA4a+KyeDGhnbp5gK6pCcFtp6FVelZQbdAQx7BYAY++ge128bUXX9Mnh
	VocWu3mhT8DS2k1Ukb22vnRq6lw8UGryru/8BS3CTid3+n5DLaQnwJW6zPq+Ie9QaJ2/iAhW7Kkkb
	BJdWuWtHtomWA+ePNzBvO+nMkRtwNJvI92p9LF7F/DWZXVlyT1firPospibyJzsW2DG2W+38ADN7e
	yUf2IFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OjJ-00000006W89-1mTl;
	Mon, 28 Apr 2025 13:41:05 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ndp-00000006CEM-0eMU;
	Mon, 28 Apr 2025 12:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=vtjvgZup4DO5ywnw9b4E1q8kivNev25eB77ifmZ/sTs=; b=m
	tCJR9N9x3gtZGhoQsEufXu5MN0AoGgBnc9N9lSkAgpBJLZQPG1Lo+OSqFi93JRvI
	ngq1on+ZxdIr8jyTfxe0JF0drb2Ew9vZJy2Hf/W6P8m2RPPwWSr8TXM061kV2MgE
	mJxqzzkAClVAGiil0kSOzSY7vw1Ezm8kRampFKLAZk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Mon, 28 Apr 2025 20:29:36 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 28 Apr 2025 20:29:36 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Jagan Teki" <jagan@amarulasolutions.com>,
	"Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	"Douglas Anderson" <dianders@chromium.org>,
	"Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Anusha Srivatsa" <asrivats@redhat.com>,
	"Paul Kocialkowski" <paulk@sys-base.io>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Hui Pu" <Hui.Pu@gehealthcare.com>,
	"Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Jani Nikula" <jani.nikula@intel.com>,
	"Sui Jingfeng" <sui.jingfeng@linux.dev>
Subject: Re:[PATCH v2 03/34] drm/bridge: analogix-anx6345: convert to
 devm_drm_bridge_alloc() API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-3-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-3-8f91a404d86b@bootlin.com>
X-NTES-SC: AL_Qu2fB/SfvEss4CGcZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jBLo1zItdntMFln1/t+OJCOIkReYbzJI9MlIe6VRY6sPAVnVyjji8TlWtnuinPbeFw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <45fac756.a42e.1967c5fd015.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iSgvCgD33wCwdA9oe4WhAA--.62923W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA49XmgPasP6GgADso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_053121_511398_2C280743 
X-CRM114-Status: UNSURE (   5.92  )
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

CkhpLAoKQXQgMjAyNS0wNC0yNSAwMjo1OToxMCwgIkx1Y2EgQ2VyZXNvbGkiIDxsdWNhLmNlcmVz
b2xpQGJvb3RsaW4uY29tPiB3cm90ZToKPlRoaXMgaXMgdGhlIG5ldyBBUEkgZm9yIGFsbG9jYXRp
bmcgRFJNIGJyaWRnZXMuCj4KPlNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+CgpSZXZpZXdlZC1ieTogQW5keSBZYW4gPGFuZHlzaHJrQDE2My5j
b20+Cgo+Cj4tLS0KPgo+Q2M6ICJVd2UgS2xlaW5lLUvDtm5pZyIgPHUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20+Cj5DYzogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+Q2M6
IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KPkNj
OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+Q2M6IFN1aSBKaW5nZmVuZyA8
c3VpLmppbmdmZW5nQGxpbnV4LmRldj4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgvYW5hbG9naXgtYW54NjM0NS5jIHwgOCArKysrLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCj5pbmRleCBmMmJhZmE2Y2Y3Nzk1
NmVjYWZjODdhYWUzYTJiNjg5MGJkYjM2Y2ZhLi5mM2ZlNDdiMTJlZGNhMWY5MmRkZDMwNmQxNTJi
ZTE0NGRmNTY0OWI1IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC9hbmFsb2dpeC1hbng2MzQ1LmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXgtYW54NjM0NS5jCj5AQCAtNjY0LDkgKzY2NCwxMCBAQCBzdGF0aWMgaW50IGFu
eDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gCXN0cnVjdCBkZXZp
Y2UgKmRldjsKPiAJaW50IGksIGVycjsKPiAKPi0JYW54NjM0NSA9IGRldm1fa3phbGxvYygmY2xp
ZW50LT5kZXYsIHNpemVvZigqYW54NjM0NSksIEdGUF9LRVJORUwpOwo+LQlpZiAoIWFueDYzNDUp
Cj4tCQlyZXR1cm4gLUVOT01FTTsKPisJYW54NjM0NSA9IGRldm1fZHJtX2JyaWRnZV9hbGxvYygm
Y2xpZW50LT5kZXYsIHN0cnVjdCBhbng2MzQ1LCBicmlkZ2UsCj4rCQkJCQkmYW54NjM0NV9icmlk
Z2VfZnVuY3MpOwo+KwlpZiAoSVNfRVJSKGFueDYzNDUpKQo+KwkJcmV0dXJuIFBUUl9FUlIoYW54
NjM0NSk7Cj4gCj4gCW11dGV4X2luaXQoJmFueDYzNDUtPmxvY2spOwo+IAo+QEAgLTczOCw3ICs3
MzksNiBAQCBzdGF0aWMgaW50IGFueDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpCj4gCS8qIExvb2sgZm9yIHN1cHBvcnRlZCBjaGlwIElEICovCj4gCWFueDYzNDVfcG93
ZXJvbihhbng2MzQ1KTsKPiAJaWYgKGFueDYzNDVfZ2V0X2NoaXBfaWQoYW54NjM0NSkpIHsKPi0J
CWFueDYzNDUtPmJyaWRnZS5mdW5jcyA9ICZhbng2MzQ1X2JyaWRnZV9mdW5jczsKPiAJCWRybV9i
cmlkZ2VfYWRkKCZhbng2MzQ1LT5icmlkZ2UpOwo+IAo+IAkJcmV0dXJuIDA7Cj4KPi0tIAo+Mi40
OS4wCj4K

