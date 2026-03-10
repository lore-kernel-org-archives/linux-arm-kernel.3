Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527B4EB104C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GT6xrSbsGz3JdNWWkC/+yqc2gpNhn25S9aXstewXALE=; b=YyPnhICbcOdG6GckuMr7e8nj8E
	bh4PHmpFLueqO13W17qZAgDAchOAgBudA6Pk3BdJgX8lMuhAR9PghPzoQYTsVL1lRM9gYahGYYX8V
	pTMq+aEHmmt4NU/e+Qsm6hLl5kTd4etd32KObepyMVJLmc9J14RjJDHZDZK45Gpyq79UNwGlUl4Qv
	DC8/+NR3B9slSoCsz8k3rPovbLF1WTvy0yC8HEg35T7hm6kM62K71/jC7U28f7z45FnGqVl6O4Gel
	p2Bg4HNJnTWEalUou/7XBmyH3a4jGKLTecuSVr5px4fOOqbvlhy1F/eGmdkZcScutf1LmwaC2gMsG
	UR06kWwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuzh-00000009FqL-29VV;
	Tue, 10 Mar 2026 11:11:21 +0000
Received: from mail-m3278.qiye.163.com ([220.197.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuzd-00000009FpN-2wUj;
	Tue, 10 Mar 2026 11:11:18 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3668f21e9;
	Tue, 10 Mar 2026 19:11:09 +0800 (GMT+08:00)
Content-Type: multipart/mixed; boundary="------------wpCoePhEUNQ1Y0Peap4Fj8Yn"
Message-ID: <971a7aa1-54cb-4e44-a1c2-8d47687ed173@rock-chips.com>
Date: Tue, 10 Mar 2026 19:11:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Add eDP support for RK3576
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260310105307.309765-1-damon.ding@rock-chips.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260310105307.309765-1-damon.ding@rock-chips.com>
X-HM-Tid: 0a9cd771900203a3kunmce5e890e376ba7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ01DHlYfSkxPSxgaSBlCSUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=LFhyFu3tLapRxoOgprExWXx5UOIWwMVycvDP6w0CnF2mkh0F4rSiuPDutZKhINyumasa9Qdf7LYEwM+Tv96eLqhkLyNTzaz7PKC/9t5ffoCB+Qm22TWdJq2HFLQHsQdSMF3DVU3O8riWvyCBiVpjes1eKJYybIYrgiO95LlBhHU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=GT6xrSbsGz3JdNWWkC/+yqc2gpNhn25S9aXstewXALE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_041117_915031_7D33DE5C 
X-CRM114-Status: GOOD (  15.67  )
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

This is a multi-part message in MIME format.
--------------wpCoePhEUNQ1Y0Peap4Fj8Yn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/10/2026 6:53 PM, Damon Ding wrote:
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3576 EVB1 board (hardware modified specially).

The DTS changes are attached as an attachment.

> 
> Patch 1~2 are to add the RK3576 eDP node.
> Patch 3~4 are to support the RK3576 Analogix DP controller.
> 
> Damon Ding (4):
>    dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
>    arm64: dts: rockchip: Add eDP node for RK3576
>    drm/bridge: analogix_dp: Add support for RK3576
>    drm/rockchip: analogix_dp: Add support for RK3576
> 
>   .../rockchip/rockchip,analogix-dp.yaml        |  6 +++-
>   arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
>   .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 15 ++++++++++
>   include/drm/bridge/analogix_dp.h              |  3 +-
>   5 files changed, 51 insertions(+), 2 deletions(-)
> 

Best regards,
Damon

--------------wpCoePhEUNQ1Y0Peap4Fj8Yn
Content-Type: text/plain; charset=UTF-8;
 name="0001-Test-only-arm64-dts-rockchip-Enable-eDP-display-on-R.patch"
Content-Disposition: attachment;
 filename*0="0001-Test-only-arm64-dts-rockchip-Enable-eDP-display-on-R.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmNGM4ZmU5NmI5NzMxYTRjMWViNjMyMWNkZTI0NDlhMTVmNWQ2MDUwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEYW1vbiBEaW5nIDxkYW1vbi5kaW5nQHJvY2stY2hp
cHMuY29tPgpEYXRlOiBUdWUsIDEwIE1hciAyMDI2IDE4OjE1OjU3ICswODAwClN1YmplY3Q6
IFtQQVRDSF0gW1Rlc3Qtb25seV1hcm02NDogZHRzOiByb2NrY2hpcDogRW5hYmxlIGVEUCBk
aXNwbGF5IG9uIFJLMzU3NgogRVZCMSBib2FyZAoKU2lnbmVkLW9mZi1ieTogRGFtb24gRGlu
ZyA8ZGFtb24uZGluZ0Byb2NrLWNoaXBzLmNvbT4KLS0tCiAuLi4vYm9vdC9kdHMvcm9ja2No
aXAvcmszNTc2LWV2YjEtdjEwLmR0cyAgICAgfCA3OSArKysrKysrKysrKysrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NzYtZXZiMS12MTAu
ZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NzYtZXZiMS12MTAuZHRz
CmluZGV4IGRiOGZlZjdhNGYxYi4uYzE2MzI1MjY2ZDA5IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU3Ni1ldmIxLXYxMC5kdHMKKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NzYtZXZiMS12MTAuZHRzCkBAIC0yMiw4ICsy
MiwxNSBAQCBhbGlhc2VzIHsKIAkJZXRoZXJuZXQxID0gJmdtYWMxOwogCX07CiAKKwliYWNr
bGlnaHQ6IGJhY2tsaWdodCB7CisJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7CisJ
CXBvd2VyLXN1cHBseSA9IDwmdmNjM3YzX2xjZF9uPjsKKwkJcHdtcyA9IDwmZ3Bpb19wd20w
IDAgMjUwMDAgMD47CisJfTsKKwogCWNob3NlbjogY2hvc2VuIHsKIAkJc3Rkb3V0LXBhdGgg
PSAic2VyaWFsMDoxNTAwMDAwbjgiOworCQlib290YXJncyA9ICJyb290PVBBUlRVVUlEPTYx
NGUwMDAwLTAwMDAgcm9vdHdhaXQiOwogCX07CiAKIAlhZGNfa2V5czogYWRjLWtleXMgewpA
QCAtNjEsMTIgKzY4LDYgQEAgYnV0dG9uLXZvbC11cCB7CiAJaGRtaS1jb24gewogCQljb21w
YXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsKIAkJdHlwZSA9ICJhIjsKLQotCQlwb3J0IHsK
LQkJCWhkbWlfY29uX2luOiBlbmRwb2ludCB7Ci0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZo
ZG1pX291dF9jb24+OwotCQkJfTsKLQkJfTsKIAl9OwogCiAJbGVkczogbGVkcyB7CkBAIC03
OCw2ICs3OSwxNCBAQCB3b3JrX2xlZDogbGVkLTAgewogCQl9OwogCX07CiAKKwlncGlvX3B3
bTA6IGdwaW8tcHdtMCB7CisJCWNvbXBhdGlibGUgPSAicHdtLWdwaW8iOworCQlncGlvcyA9
IDwmZ3BpbzAgUktfUEI1IEdQSU9fQUNUSVZFX0hJR0g+OworCQlwaW5jdHJsLTAgPSA8Jmdw
aW9fcHdtMF9waW4+OworCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQkjcHdtLWNl
bGxzID0gPDM+OworCX07CisKIAl2YnVzNXYwX3R5cGVjOiByZWd1bGF0b3ItdmJ1czV2MC10
eXBlYyB7CiAJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKIAkJcmVndWxhdG9y
LW5hbWUgPSAidmJ1czV2MF90eXBlYyI7CkBAIC0yNjQsNiArMjczLDM4IEBAICZjb21icGh5
MV9wc3UgewogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKKyZlZHAgeworCWZvcmNlLWhwZDsK
KwlzdGF0dXMgPSAib2theSI7CisKKwlhdXgtYnVzIHsKKwkJcGFuZWwgeworCQkJY29tcGF0
aWJsZSA9ICJlZHAtcGFuZWwiOworCQkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCQkJ
cG93ZXItc3VwcGx5ID0gPCZ2Y2MzdjNfbGNkX24+OworCQkJbm8taHBkOworCisJCQlwb3J0
IHsKKwkJCQlwYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50
ID0gPCZlZHBfb3V0X3BhbmVsPjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9OworfTsKKwor
JmVkcF9pbiB7CisJZWRwX2luX3ZwMDogZW5kcG9pbnQgeworCQlyZW1vdGUtZW5kcG9pbnQg
PSA8JnZwMF9vdXRfZWRwPjsKKwl9OworfTsKKworJmVkcF9vdXQgeworCWVkcF9vdXRfcGFu
ZWw6IGVuZHBvaW50IHsKKwkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbl9lZHA+Owor
CX07Cit9OworCiAmZ21hYzAgewogCWNsb2NrX2luX291dCA9ICJvdXRwdXQiOwogCXBoeS1t
b2RlID0gInJnbWlpLXJ4aWQiOwpAQCAtMzAwLDE5ICszNDEsNyBAQCAmZ3B1IHsKIH07CiAK
ICZoZG1pIHsKLQlzdGF0dXMgPSAib2theSI7Ci19OwotCi0maGRtaV9pbiB7Ci0JaGRtaV9p
bl92cDA6IGVuZHBvaW50IHsKLQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ2cDBfb3V0X2hkbWk+
OwotCX07Ci19OwotCi0maGRtaV9vdXQgewotCWhkbWlfb3V0X2NvbjogZW5kcG9pbnQgewot
CQlyZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfY29uX2luPjsKLQl9OworCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CiB9OwogCiAmaGRwdHhwaHkgewpAQCAtNzc0LDYgKzgwMywxMiBAQCAmcGNp
ZTEgewogfTsKIAogJnBpbmN0cmwgeworCWdwaW9fcHdtMCB7CisJCWdwaW9fcHdtMF9waW46
IGdwaW8tcHdtMC1waW4geworCQkJcm9ja2NoaXAscGlucyA9IDwwIFJLX1BCNSBSS19GVU5D
X0dQSU8gJnBjZmdfcHVsbF9kb3duPjsKKwkJfTsKKwl9OworCiAJYmx1ZXRvb3RoIHsKIAkJ
YnRfcmVnX29uOiBidC1yZWctb24gewogCQkJcm9ja2NoaXAscGlucyA9IDwxIFJLX1BDNyBS
S19GVU5DX0dQSU8gJnBjZmdfcHVsbF91cD47CkBAIC05MzYsOCArOTcxLDggQEAgJnZvcF9t
bXUgewogfTsKIAogJnZwMCB7Ci0JdnAwX291dF9oZG1pOiBlbmRwb2ludEBST0NLQ0hJUF9W
T1AyX0VQX0hETUkwIHsKLQkJcmVnID0gPFJPQ0tDSElQX1ZPUDJfRVBfSERNSTA+OwotCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfaW5fdnAwPjsKKwl2cDBfb3V0X2VkcDogZW5kcG9p
bnRAUk9DS0NISVBfVk9QMl9FUF9FRFAwIHsKKwkJcmVnID0gPFJPQ0tDSElQX1ZPUDJfRVBf
RURQMD47CisJCXJlbW90ZS1lbmRwb2ludCA9IDwmZWRwX2luX3ZwMD47CiAJfTsKIH07Ci0t
IAoyLjM0LjEKCg==

--------------wpCoePhEUNQ1Y0Peap4Fj8Yn--

