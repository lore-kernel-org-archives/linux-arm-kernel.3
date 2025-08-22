Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F74CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wF1ylDXFmSCDCWt+ugfOeabac+MMovP6GAcpIG+yjw0=; b=ZpsRHCb8QBqEzP6lkpWJHtGkVU
	yQswfA4u4JoaUuqKxbDj46NDtiri1aHDUcKMYB5bZJqyo5O8P3JC7XSzUQElyCPjZZZ1vznfYbDOj
	LLHbFmJZBb6AUO8o/Kkd5IqBjEmzItQqzxYm7YsRt3Lc9YnRDvNtNG/J5RElKMuFRVvxAk3T7MXiI
	1/9psK3+r1V7a7CpdPNbtWWm0eljzPhgA5BkTJ26whFLO4TwUg+grqQYg2v2cOXUEKqQft9UH0TbF
	yMsfloa9qzjX/vdXhWfXGcyKsgl+yxi1nrSt4uAKmLWVDLSzhax/xEzk8fjn9qY1C+sXRKIaqtHrn
	YOz6gV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPrO-00000002J5q-3IZq;
	Fri, 22 Aug 2025 11:23:06 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIQ8-00000001Nyn-09tM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:26:30 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 22 Aug 2025 11:26:02 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 22 Aug 2025 11:26:02 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
	jszhang@kernel.org, jan.petrous@oss.nxp.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: Re: Re: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add
 eic7700 ethernet driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <548973df-2fa8-4502-9f7c-668d0eeb16c6@lunn.ch>
References: <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
 <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
 <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
 <28a48738-af05-41a4-be4c-5ca9ec2071d3@lunn.ch>
 <2b4deeba.3f61.1985fb2e8d4.Coremail.lizhi2@eswincomputing.com>
 <bad83fec-afca-4c41-bee4-e4e4f9ced57a@lunn.ch>
 <3261748c.629.198cfa3bc10.Coremail.lizhi2@eswincomputing.com>
 <548973df-2fa8-4502-9f7c-668d0eeb16c6@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1935a8ad.648.198cfcfdcb1.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDH3g9L46do9c3BAA--.11720W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgECDGinSk8OdAABs8
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_202628_332628_6F7339CD 
X-CRM114-Status: UNSURE (   8.55  )
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

RGVhciBBbmRyZXcgTHVubiwKVGhhbmsgeW91IGZvciB5b3VyIHZhbHVhYmxlIGFuZCBwcm9mZXNz
aW9uYWwgc3VnZ2VzdGlvbnMuClBsZWFzZSBmaW5kIG91ciBleHBsYW5hdGlvbnMgZW1iZWRkZWQg
YmVsb3cgeW91ciBjb21tZW50cyBpbiB0aGUKb3JpZ2luYWwgZW1haWwuCgpCZXN0IHJlZ2FyZHMs
CgpMaSBaaGkKRXN3aW4gQ29tcHV0aW5nCgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R
5Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4KPiDlj5HpgIHml7bpl7Q6MjAy
NS0wOC0yMiAxMToxNzozNyAo5pif5pyf5LqUKQo+IOaUtuS7tuS6ujog5p2O5b+XIDxsaXpoaTJA
ZXN3aW5jb21wdXRpbmcuY29tPgo+IOaKhOmAgTogd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5n
LmNvbSwgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpl
dEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBr
ZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywg
bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwg
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWssIHlvbmcubGlhbmcuY2hvb25nQGxpbnV4LmludGVs
LmNvbSwgdmxhZGltaXIub2x0ZWFuQG54cC5jb20sIGpzemhhbmdAa2VybmVsLm9yZywgamFuLnBl
dHJvdXNAb3NzLm54cC5jb20sIHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bSwgaW5vY2hpYW1hQGdtYWlsLmNvbSwgYm9vbi5raGFpLm5nQGFsdGVyYS5jb20sIGRmdXN0aW5p
QHRlbnN0b3JyZW50LmNvbSwgMHgxMjA3QGdtYWlsLmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
LCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBw
aW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20KPiDkuLvpopg6IFJlOiBSZTogUmU6IFJlOiBS
ZTogUmU6IFtQQVRDSCB2MyAyLzJdIGV0aGVybmV0OiBlc3dpbjogQWRkIGVpYzc3MDAgZXRoZXJu
ZXQgZHJpdmVyCj4gCj4gPiBXZSByZS10dW5lZCBhbmQgdmVyaWZpZWQgdGhhdCBzZXR0aW5nIHRo
ZSBUWEQgYW5kIFJYRCBkZWxheXMgdG8gMCBhbmQKPiA+IGNvbmZpZ3VyaW5nIFRYRU4gYW5kIFJY
RFYgdG8gMCB5aWVsZGVkIHRoZSBzYW1lIGhhcmR3YXJlIHBlcmZvcm1hbmNlIGFzCj4gPiBsb25n
IGFzIHdlIG9ubHkgYXBwbGllZCBkZWxheXMgKGUuZy4gMjAwcHMpIHRvIFRYQ0xLIGFuZCBSWENM
Sy4KPiAKPiBUaGlzIGlzIGluIGFkZGl0aW9uIHRvIHBoeS1tb2RlID0gJ3JnbWlpLWlkJz8KPiAK
Clllcywgb3VyIHJlLXR1bmluZyBhbmQgdmVyaWZpY2F0aW9uIHdlcmUgcGVyZm9ybWVkIHdpdGgg
cGh5LW1vZGUgc2V0IHRvCnJnbWlpLWlkLgoKPiA+IFRoZXJlZm9yZSwgaW4gdGhlIG5leHQgcGF0
Y2gsIHdlIHdpbGwgZHJvcCB0aGUgdmVuZG9yLXNwZWNpZmljIHByb3BlcnRpZXMKPiA+IChlLmcu
IGVzd2luLGRseS1wYXJhbS0qKSBhbmQga2VlcCBvbmx5IHRoZSBzdGFuZGFyZCBhdHRyaWJ1dGVz
LCBuYW1lbHkKPiA+IHJ4LWludGVybmFsLWRlbGF5LXBzIGFuZCB0eC1pbnRlcm5hbC1kZWxheS1w
cy4KPiA+IElzIHRoaXMgY29ycmVjdD8KPiAKPiBZZXMsIDIwMHBzIGlzIGEgc21hbGwgdHVuaW5n
IHZhbHVlLCB3aGVuIHRoZSBQSFkgYWRkcyB0aGUgMm5zLiBUaGlzIGlzCj4gTy5LLgo+IAo+IAlB
bmRyZXcK

