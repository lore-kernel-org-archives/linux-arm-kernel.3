Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4F2CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 06:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbSA8NDCnusHdgd1dttsll2/WAB1xmi3fNprMtwEA2o=; b=U6SpMdtupiX2oRDbwvcqY+g3Mt
	gjdvaDngZLD+wc1T6XLblgrDyykXX0ntSHy4Bt4JaUFuX1GsfjgDCjc310AUtgzbIH/xTZtsZKkIE
	7kYVd+O9jeaskZfyYqheo1quWKxWELTOls8NgWqHnsMvcDIefh+5u0J/y6E0y9cKcMEhs84g5D4XX
	5h/HMTn5jJ8WAYcLa3wsl/Id2fmgUsw9PtO+aAtcElq1+Ddpmn6bolve9pVOLYYQ6FjDGq+Yhnxke
	FxiuJMChQSK9mIHtYgAlRBL0M8evve6ASgLmhyFt5zrglQmDu6W1M97byObmcPxrqDHN32/pHupro
	Fg/BndWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVqY-0000000F8TU-2ltM;
	Mon, 08 Sep 2025 06:59:26 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVnc-0000000F7Dl-115T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 06:56:26 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Mon, 8 Sep 2025 14:55:55 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Mon, 8 Sep 2025 14:55:55 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: weishangjuan@eswincomputing.com, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com, faizal.abdul.rahim@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
	boon.khai.ng@altera.com, 0x1207@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	emil.renner.berthing@canonical.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v5 2/2] ethernet: eswin: Add eic7700 ethernet driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aLlpUOr3IJzTuV1g@shell.armlinux.org.uk>
References: <20250904085913.2494-1-weishangjuan@eswincomputing.com>
 <20250904090125.2598-1-weishangjuan@eswincomputing.com>
 <aLlpUOr3IJzTuV1g@shell.armlinux.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <a05a5e6.1188.199281c1df8.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgA3WxH7fb5oznPLAA--.15808W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQETDGi9s3cdZgABs0
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_235624_536959_015E93EE 
X-CRM114-Status: GOOD (  20.72  )
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

RGVhciBSdXNzZWxsIEtpbmcsClRoYW5rIHlvdSBmb3IgeW91ciB2YWx1YWJsZSBhbmQgcHJvZmVz
c2lvbmFsIHN1Z2dlc3Rpb25zLgoKWW91J3JlIHJpZ2h0IOKAlCB0eF9kZWxheV9wcywgcnhfZGVs
YXlfcHMgYW5kIGhzcF9yZWdtYXAgYXJlCm9ubHkgdXNlZCBpbiBwcm9iZSwgc28gd2XigJlsbCBz
d2l0Y2ggdGhlbSB0byBsb2NhbCB2YXJpYWJsZXMuCldl4oCZbGwgYWxzbyBpbmxpbmUgdGhlIGRl
bGF5IGhhbmRsaW5nIGludG8gcHJvYmUgYXMgc3VnZ2VzdGVkLgpUaGlzIHdpbGwgYmUgdXBkYXRl
ZCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKQmVzdCByZWdhcmRzLAoKTGkgWmhpCkVzd2luIENvbXB1
dGluZwo+IC0tLS0t5Y6f5aeL6YKu5Lu2LS0tLS0KPiDlj5Hku7bkuro6ICJSdXNzZWxsIEtpbmcg
KE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4g5Y+R6YCB5pe26Ze0OjIwMjUtMDkt
MDQgMTg6MjY6MjQgKOaYn+acn+WbmykKPiDmlLbku7bkuro6IHdlaXNoYW5nanVhbkBlc3dpbmNv
bXB1dGluZy5jb20KPiDmioTpgIE6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBhbmRyZXcr
bmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20s
IGt1YmFAa2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIHJvYmhAa2VybmVsLm9yZywga3J6
aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcsIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50
b3JndWVAZm9zcy5zdC5jb20sIHlvbmcubGlhbmcuY2hvb25nQGxpbnV4LmludGVsLmNvbSwgdmxh
ZGltaXIub2x0ZWFuQG54cC5jb20sIGZhaXphbC5hYmR1bC5yYWhpbUBsaW51eC5pbnRlbC5jb20s
IHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbSwgaW5vY2hpYW1hQGdtYWls
LmNvbSwgamFuLnBldHJvdXNAb3NzLm54cC5jb20sIGpzemhhbmdAa2VybmVsLm9yZywgcC56YWJl
bEBwZW5ndXRyb25peC5kZSwgYm9vbi5raGFpLm5nQGFsdGVyYS5jb20sIDB4MTIwN0BnbWFpbC5j
b20sIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcs
IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGVtaWwucmVubmVyLmJl
cnRoaW5nQGNhbm9uaWNhbC5jb20sIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBl
c3dpbmNvbXB1dGluZy5jb20sIGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFn
aGVsYUBlaW5mb2NoaXBzLmNvbQo+IOS4u+mimDogUmU6IFtQQVRDSCB2NSAyLzJdIGV0aGVybmV0
OiBlc3dpbjogQWRkIGVpYzc3MDAgZXRoZXJuZXQgZHJpdmVyCj4gCj4gT24gVGh1LCBTZXAgMDQs
IDIwMjUgYXQgMDU6MDE6MjVQTSArMDgwMCwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNv
bSB3cm90ZToKPiA+ICtzdHJ1Y3QgZWljNzcwMF9xb3NfcHJpdiB7Cj4gPiArCXN0cnVjdCBwbGF0
X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQ7Cj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldjsKPiA+
ICsJc3RydWN0IHJlZ21hcCAqaHNwX3JlZ21hcDsKPiA+ICsJdTMyIHR4X2RlbGF5X3BzOwo+ID4g
Kwl1MzIgcnhfZGVsYXlfcHM7Cj4gPiArfTsKPiA+ICsKPiA+ICsvKioKPiA+ICsgKiBlaWM3NzAw
X2FwcGx5X2RlbGF5IC0gQXBwbHkgVFggb3IgUlggZGVsYXkgdG8gYSByZWdpc3RlciB2YWx1ZS4K
PiA+ICsgKiBAZGVsYXlfcHM6IERlbGF5IGluIHBpY29zZWNvbmRzLCBjb252ZXJ0ZWQgdG8gMC4x
bnMgdW5pdHMuCj4gPiArICogQHJlZzogICAgICBQb2ludGVyIHRvIHJlZ2lzdGVyIHZhbHVlIHRv
IHVwZGF0ZSBpbi1wbGFjZS4KPiA+ICsgKiBAaXNfcng6ICAgIFRydWUgZm9yIFJYIGRlbGF5IChi
aXRzIDMwOjI0KSwgZmFsc2UgZm9yIFRYIGRlbGF5IChiaXRzIDE0OjgpLgo+ID4gKyAqCj4gPiAr
ICogQ29udmVydHMgZGVsYXkgZnJvbSBwcyB0byAwLjFucyB1bml0cywgY2FwcGVkIGJ5IEVJQzc3
MDBfTUFYX0RFTEFZX1VOSVQuCj4gPiArICogVXBkYXRlcyBvbmx5IHRoZSBSWCBvciBUWCBkZWxh
eSBmaWVsZCAodXNpbmcgRklFTERfUFJFUCksIGxlYXZpbmcgYWxsCj4gPiArICogb3RoZXIgYml0
cyBpbiAqQHJlZyB1bmNoYW5nZWQuCj4gPiArICovCj4gPiArc3RhdGljIHZvaWQgZWljNzcwMF9h
cHBseV9kZWxheSh1MzIgZGVsYXlfcHMsIHUzMiAqcmVnLCBib29sIGlzX3J4KQo+ID4gK3sKPiA+
ICsJdTMyIHZhbCA9IG1pbihkZWxheV9wcyAvIDEwMCwgRUlDNzcwMF9NQVhfREVMQVlfVU5JVCk7
Cj4gPiArCj4gPiArCWlmIChpc19yeCkgewo+ID4gKwkJKnJlZyAmPSB+RUlDNzcwMF9FVEhfUlhf
QURKX0RFTEFZOwo+ID4gKwkJKnJlZyB8PSBGSUVMRF9QUkVQKEVJQzc3MDBfRVRIX1JYX0FESl9E
RUxBWSwgdmFsKTsKPiA+ICsJfSBlbHNlIHsKPiA+ICsJCSpyZWcgJj0gfkVJQzc3MDBfRVRIX1RY
X0FESl9ERUxBWTsKPiA+ICsJCSpyZWcgfD0gRklFTERfUFJFUChFSUM3NzAwX0VUSF9UWF9BREpf
REVMQVksIHZhbCk7Cj4gPiArCX0KPiA+ICt9Cj4gCj4gLi4uCj4gCj4gPiArCS8qIFJlYWQgcngt
aW50ZXJuYWwtZGVsYXktcHMgYW5kIHVwZGF0ZSByeF9jbGsgZGVsYXkgKi8KPiA+ICsJaWYgKCFv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwKPiA+ICsJCQkJICAicngtaW50
ZXJuYWwtZGVsYXktcHMiLAo+ID4gKwkJCQkgICZkd2NfcHJpdi0+cnhfZGVsYXlfcHMpKSB7Cj4g
PiArCQllaWM3NzAwX2FwcGx5X2RlbGF5KGR3Y19wcml2LT5yeF9kZWxheV9wcywKPiA+ICsJCQkJ
ICAgICZldGhfZGx5X3BhcmFtLCB0cnVlKTsKPiAKPiBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIGZpZ3Vy
ZSBvdXQgdGhlIHJlYXNvbmluZyBiZWhpbmQgdGhlIGZvbGxvd2luZzoKPiAKPiAxLiB0aGUgcHJl
c2VuY2Ugb2YgZHdjX3ByaXYtPnJ4X2RlbGF5X3BzIGFuZCBkd2NfcHJpdi0+dHhfZGVsYXlfcHMK
PiAgICByYXRoZXIgdGhhbiBqdXN0IHVzaW5nIGEgbG9jYWwgdmFyaWFibGUgKCJkZWxheSIgPykK
PiAyLiB0aGUgcHJlc2VuY2Ugb2YgZWljNzcwMF9hcHBseV9kZWxheSgpIHdoZW4gd2UgaGF2ZSB0
byBkbyBzb21ldGhpbmcKPiAgICBkaWZmZXJlbnQgdG8gZ2V0IHRoZSBkZWxheSB2YWx1ZSBhbnl3
YXkKPiAKPiBJdCBzZWVtcyB0byBtZSB0aGF0IHRoaXMgc2hvdWxkIGVpdGhlciBiZToKPiAKPiBz
dGF0aWMgdm9pZCBlaWM3NzAwX3BhcnNlX2RlbGF5KHUzMiAqcmVnLCBzdHJ1Y3QgZGV2aWNlICpk
ZXYsCj4gCQkJCWNvbnN0IGNoYXIgKm5hbWUsIGJvb2wgaXNfcngpCj4gewo+IAl1MzIgZGVsYXk7
Cj4gCj4gCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25vZGUsIG5hbWUsICZkZWxh
eSkpIHsKPiAJCWRldl93YXJuKGRldiwgImNhbid0IGdldCAlc1xuIiwgbmFtZSk7Cj4gCQlyZXR1
cm4KPiAJfQo+IAo+IAlpZiAoaXNfcngpIHsKPiAJCSpyZWcgJj0gfkVJQzc3MDBfRVRIX1JYX0FE
Sl9ERUxBWTsKPiAJCSpyZWcgfD0gRklFTERfUFJFUChFSUM3NzAwX0VUSF9SWF9BREpfREVMQVks
IGRlbGF5KTsKPiAJfSBlbHNlIHsKPiAJCSpyZWcgJj0gfkVJQzc3MDBfRVRIX1RYX0FESl9ERUxB
WTsKPiAJCSpyZWcgfD0gRklFTERfUFJFUChFSUM3NzAwX0VUSF9UWF9BREpfREVMQVksIGRlbGF5
KTsKPiAJfQo+IH0KPiAKPiBvciBqdXN0IG5vdCBib3RoZXIgd2l0aCB0aGUgZnVuY3Rpb24gYXQg
YWxsIGFuZCBqdXN0IHdyaXRlIGl0IG91dAo+IGZ1bGx5IGluIHRoZSBwcm9iZSBmdW5jdGlvbi4K
PiAKPiBUaGFua3MuCj4gCj4gLS0gCj4gUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5h
cm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj4gRlRUUCBpcyBoZXJlISA4ME1icHMg
ZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEK

