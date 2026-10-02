Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC2FCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M+UKP95uOCXtlBZBQ87VI3/zEbKTPu8471WPinWG1E=; b=Pm3bU2KMxkhyNCTBwai6SyKSEu
	byMwhjuUo7EPxuPB6Rq7yBrOB/Dbz/GDxzLtKUUOJPU1uNG/gOVgjv5D/apNE2Xhv5aa0Coap8mhc
	RWZzNnlttedtZbDhJCsl39syBtcK01m1dc67PWiuMEA9+HUDyFaPxLNvcrR3sRT/zI4OnwuEstNk6
	t7JIgHFr2+cHd3KDLbHnAcyUi48zUTThOeWpbf/iKAwz0ur3LAYoENapHjuIYDSR37XqL5ytMBLh7
	Kqv1GEPpvRFN5m+SCyRFQ8H1R/KP/T07HBBcb2MhfdzyQ6PiXI3pJPJymhZI/lQ/vIspcerBWIfUv
	mHLVM9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSrW-0000000AVYN-2Qaz;
	Fri, 02 Oct 2026 02:19:02 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSrT-0000000AVXj-2nbQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 02:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=6M+UKP95uOCXtlBZBQ87VI3/zEbKTPu8471WPinWG1E=; b=S
	2vsJkv3QYTUZBtD4qZ5KKZEy3Wt7v3iZeooJeD4KK2ke6DeaeheqnjTGWi3fTUPi
	rwnPBv4Z8+0MkGSomU+EFbbuTRRSqfWH3UqDpcEkcrx4bodZ1jwgTt1kaFf1XP2t
	EicZ4QercFKgb/7D/E8TZnHrd96UoQu5HugL1ZjGVs=
Date: Fri, 2 Oct 2026 10:17:53 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Linus Walleij" <linusw@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	longzhao@ambarella.com, "Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	"Michael Walle" <mwalle@kernel.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v9 13/15] serial: 8250_dw: add Ambarella CV75 quirks
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAD++jLnv1Q7ChHuLo=ad9edqhZL8MNaMab8huMAepK_LwqVzGQ@mail.gmail.com>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-13-486cc289a4b8@ambarella.com>
 <2026100140-overbite-mundane-fc79@gregkh>
 <CAD++jLnv1Q7ChHuLo=ad9edqhZL8MNaMab8huMAepK_LwqVzGQ@mail.gmail.com>
X-NTES-SC: AL_Qu2SAvWbuEws5SSebekcn0wRhug/UMa4u/sm3YNXc8AFnCHm4xgjUkF5HHHP+cSgBSmMqBeOdRZX299KTblabN9UUWfBtPNqeWUCoV4bFw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4405a61f.505.1a0fa675e43.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hSgvCgDnL_tRFL9qW95RAA--.9580W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxhGjFWq-FFEAigAA37
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_191900_606793_C79FEF17 
X-CRM114-Status: GOOD (  18.42  )
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

SGkgR3JlZywgTGludXMsCgpUaGFua3MuCgpUaGlzIHNlcmllcyBmb2xsb3dzIHRoZSBuZXctdmVu
ZG9yLCBuZXctU29DIHByb2Nlc3MgYW5kIGlzIHNlbnQKYXMgb25lIHNldCwgc28gdGhlIG5ldyBL
Y29uZmlnIHN5bWJvbCBhbmQgdGhlIGRyaXZlcnMgdGhhdCB1c2UgaXQKbGFuZCB0b2dldGhlci4K
CklmIGl0IGhhcyB0byBiZSBzcGxpdCwgdGhlIEdQSU8gcGF0Y2hlcyBhbmQgdGhlIFVBUlQgcGF0
Y2hlcyBjYW4KZ28gb3V0IGFzIHRoZWlyIG93biBzZXJpZXMuIFRoZSBTb0MgcGF0Y2hlcyBhbmQg
dGhlIENWNzUgY2xvY2sKZHJpdmVyIHNob3VsZCBzdGF5IGluIG9uZSBzZXJpZXM6IHRoZSBjbG9j
ayBLY29uZmlnIGRlcGVuZHMgb24KQVJDSF9BTUJBUkVMTEEsIHdoaWNoIGlzIGFkZGVkIGJ5IHRo
ZSBhcm02NCBwYXRjaC4KCldvdWxkIHRoYXQgc3BsaXQgYmUgYWNjZXB0YWJsZSBmb3IgeW91PwoK
QmVzdCByZWdhcmRzLApMb25nIFpoYW8KCkF0IDIwMjYtMTAtMDIgMDM6MjA6NTEsICJMaW51cyBX
YWxsZWlqIiA8bGludXN3QGtlcm5lbC5vcmc+IHdyb3RlOgo+T24gVGh1LCBPY3QgMSwgMjAyNiBh
dCAyOjUy4oCvUE0gR3JlZyBLcm9haC1IYXJ0bWFuCj48Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+IHdyb3RlOgo+PiBPbiBUaHUsIE9jdCAwMSwgMjAyNiBhdCAwODo0MTowMlBNICswODAwLCBM
b25nIFpoYW8gdmlhIEI0IFJlbGF5IHdyb3RlOgo+Cj4+ID4gRnJvbTogTG9uZyBaaGFvIDxsb25n
emhhb0BhbWJhcmVsbGEuY29tPgo+PiA+Cj4+ID4gVGhlIEFtYmFyZWxsYSBDVjc1IFVBUlQgaXMg
QW1iYXJlbGxhIElQLCBub3QgYSBTeW5vcHN5cyBEZXNpZ25XYXJlCj4+ID4gbGljZW5zZWQgYmxv
Y2suIEF0IHRoZSByZWdpc3RlciBsZXZlbCBpdCBpcyBjbG9zZSBlbm91Z2ggdG8gRFcgQVBCIFVB
UlQKPj4gPiB0aGF0IGEgZnVsbCBjdXN0b20gVUFSVCBkcml2ZXIgaXMgdW5uZWNlc3Nhcnk6IHJl
dXNlIDgyNTBfZHcgd2l0aCBhCj4+ID4gc21hbGwgcGxhdGZvcm0gcXVpcmsuCj4+ID4KPj4gPiBR
dWlya3M6Cj4+ID4gLSBrZWVwIElFUiBFVE9JIChiaXQgNSkgc2V0IGZvciBSWCB0aW1lb3V0IGJl
aGF2aW91cgo+PiA+IC0gc2tpcCBzZXRfcmF0ZTsgYmF1ZCBjbG9jayBpcyBtYW5hZ2VkIG91dHNp
ZGUgdGhlIFVBUlQgYmxvY2sKPj4gPgo+PiA+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51c3dAa2VybmVsLm9yZz4KPj4gPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRy
aXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4+ID4gUmV2aWV3ZWQtYnk6IElscG8gSsOk
cnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KPj4gPiBTaWduZWQtb2ZmLWJ5
OiBMb25nIFpoYW8gPGxvbmd6aGFvQGFtYmFyZWxsYS5jb20+Cj4+ID4gLS0tCj4+ID4gIGRyaXZl
cnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZHcuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4+Cj4+IFdo
ZW4geW91IHN1Ym1pdCBsb3RzIG9mIGRpZmZlcmVudCBzdWJzeXN0ZW0gcGF0Y2hlcyBhbGwgaW4g
b25lIHNlcmllcywKPj4gaXQncyBoYXJkLCBpZiBub3QgaW1wb3NzaWJsZSwgZm9yIHN1YnN5c3Rl
bSBtYWludGFpbmVycyB0byB0YWtlIHRoZW0gOigKPgo+SW4gbXkgZXhwZXJpZW5jZSBwZW9wbGUg
ZG8gdGhpcyBpbiBjYXNlcyBsaWtlIHRoaXMgaXQgaXMgYmVjYXVzZSB0aGV5Cj5lc3NlbnRpYWxs
eSBkdW1wIG91dCB0aGVpciAiYnJpbmctdXAiIHRyZWUsIHRoZSB0aGluZyB0aGV5IGhhdmUKPmJv
b3Rpbmcgb24gdGhlIGhhcmR3YXJlIHNvIHRoZXkga25vdyB0aGUgcGllY2VzIHdvcmsgdG9nZXRo
ZXIuCj4KPkxvbmc6IGNhbiB5b3Ugc3BsaXQgaXQgdXAgaW4gdG9waWMgYnJhbmNoZXMgYW5kIHdv
cmsgb24gZS5nLiB0aGUKPnNlcmlhbCBkcml2ZXIgb24gYSBzZXBhcmF0ZSBicmFuY2g/Cj4KPkEg
YmV0dGVyIHdheSB0byB0ZXN0IHRoZSB3aG9sZSBzZXQgb2YgcGF0Y2VzIGlzIHRvIGp1c3QgY3Jl
YXRlIGEKPm1peGRvd24gYnJhbmNoIHdoZXJlIHlvdSBtZXJnZSBhbGwgdGhlIHRvcGljIGJyYW5j
aGVkIGludG8KPm9uZSAidGVzdCIgYnJhbmNoLCB0aGVuIHlvdSBib290IGFuZCB0ZXN0IHRoaXMg
YmVmb3JlIHNlbmRpbmcKPm91dCBlYWNoIGJyYW5jaCBzZXBhcmF0ZWx5Lgo+Cj5FYWNoIHRvcGlj
IGJyYW5jaCBjYW4gYmUgdmVyc2lvbmVkIHNlcGFyYXRlbHkgd2l0aCBiNC4KPgo+WW91cnMsCj5M
aW51cyBXYWxsZWlqCg==

