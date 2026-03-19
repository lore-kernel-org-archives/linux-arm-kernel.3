Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648D5107528C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hMouKBOO7iljDh84gym0ir5SjUx+qmM6vACrsQWh1k=; b=aagTonxGQOfLZ5s6nxFkjLc0mU
	O8LA+4PB5dKnsNb3FixLqkAZ8xhQehdUdEIaFyHGggKorJotVW+2Y/coZASppIJjRkkQTyzcsvP3i
	5y2Yt4ra4/pG6s5hvX4sg6rXmEE1hJ8apze0HD8dhydanJtpXdD2Tzcl2ErGn4gbKZUkY0QNRfCCe
	RsUBeSeTFAi3ic8Eon3hcaeH4jQXwzZQwrgoXd0uz7aVPCJk6k1c+jqlvl8BAR/O5otiJwLpdDFSY
	pB2M5rlSCJbwj/sEYyiU+Ku2rhDFP85FDySCnzsp8tGjC3ptYLdAbbG5BQ9NBjwKzYVMejdO7xcar
	R1F1QuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3A7G-0000000AMjr-3YbO;
	Thu, 19 Mar 2026 09:56:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3A7F-0000000AMjc-0Cso;
	Thu, 19 Mar 2026 09:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2hMouKBOO7iljDh84gym0ir5SjUx+qmM6vACrsQWh1k=; b=fYHBl8sLhnyAGzvNG1txO7JRBg
	PLhYD8bSQM4eIPVyHXgtMdemRloymfhazCxdATEZk2a10o9giESbMV9bV2f5wveQsCfrBBqyJaapE
	IftiMPnlN/FjjCu2aL7umnOrL7IUJRR9rhnpMUDL7Shdw3YjdvitpWg56LTRGGTEOtunOLuL7MZYO
	kR1IXwP/mmDSjXHfAQLGLXuVFbKhJvQZmRnWpFevCAYQKM/tahbROB1JEE1fetEYJR2LYriESBvCT
	aNGIcDv13cNrZEi2SMqHcTsrRs+wq6ND1gV88ElP+nsvt92LdBlFFiUTXKivlmxveoimXWUTk3dv1
	WRkP7aTA==;
Received: from azure-sdnproxy.icoremail.net ([52.229.168.213])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3A7B-0000000DCCK-2Hcs;
	Thu, 19 Mar 2026 09:56:31 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 19 Mar 2026 17:55:31 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 19 Mar 2026 17:55:31 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: krzk+dt@kernel.org, "Conor Dooley" <conor@kernel.org>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH net-next v4 1/3] dt-bindings: ethernet: eswin: add
 clock sampling control
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260313-stiffness-item-c451eaef970d@spud>
References: <20260313075234.1567-1-lizhi2@eswincomputing.com>
 <20260313075351.1584-1-lizhi2@eswincomputing.com>
 <20260313-stiffness-item-c451eaef970d@spud>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4d45d39b.591c.19d05858b58.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDHaXMTyLtpTOUJAA--.3066W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgELDGm61AkcbQAAs7
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_095629_894221_128E248C 
X-CRM114-Status: GOOD (  20.75  )
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

SGkgS3J6eXN6dG9mLAoKQ291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCBDb25vcuKAmXMg
ZmVlZGJhY2sgb24gdGhlIGNvbXBhdGlibGUgbmFtaW5nPwoKQ29ub3IgaGFzIHJldmlld2VkIHRo
ZSBwYXRjaCBhbmQgcHJvdmlkZWQgaGlzIEFja2VkLWJ5LCBidXQgYWxzbyBub3RlZAp0aGF0IHRo
ZXJlIG1pZ2h0IGJlIGNvbmNlcm5zIHJlZ2FyZGluZyB0aGUgY29tcGF0aWJsZSBzdHJpbmcuCgpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlIGN1cnJlbnQgbmFtaW5nIGlzIGFjY2VwdGFibGUsIG9y
IGlmIGFueSBjaGFuZ2VzCmFyZSByZXF1aXJlZC4KClRoYW5rcywKWmhpIExpCgoKPiAtLS0tLeWO
n+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQ29ub3IgRG9vbGV5IiA8Y29ub3JAa2VybmVs
Lm9yZz4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMy0xNCAwMTozOTo1OCAo5pif5pyf5YWtKQo+IOaU
tuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTogZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1AZGF2ZW1sb2Z0Lm5l
dCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2JoQGtlcm5lbC5vcmcs
IGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFs
ZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrLCB3
ZW5zQGtlcm5lbC5vcmcsIHBqd0BrZXJuZWwub3JnLCBwYWxtZXJAZGFiYmVsdC5jb20sIGFvdUBl
ZWNzLmJlcmtlbGV5LmVkdSwgYWxleEBnaGl0aS5mciwgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZywgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnLCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29t
LCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHByaXRlc2gucGF0ZWxAZWluZm9jaGlw
cy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20KPiDkuLvpopg6IFJlOiBbUEFU
Q0ggbmV0LW5leHQgdjQgMS8zXSBkdC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBhZGQgY2xv
Y2sgc2FtcGxpbmcgY29udHJvbAo+IAo+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDAzOjUzOjUx
UE0gKzA4MDAsIGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20gd3JvdGU6Cj4gPiBGcm9tOiBaaGkg
TGkgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPiAKPiA+IER1ZSB0byBjaGlwIGJhY2tl
bmQgcmVhc29ucywgdGhlcmUgaXMgYWxyZWFkeSBhbiBhcHByb3hpbWF0ZWx5IDQtNSBucwo+ID4g
c2tldyBiZXR3ZWVuIHRoZSBSWCBjbG9jayBhbmQgZGF0YSBvZiB0aGUgZXRoMSBNQUMgY29udHJv
bGxlciBpbnNpZGUKPiA+IHRoZSBzaWxpY29uLgo+ID4gCj4gPiBGb3IgMTAwME0sIHRoZSBSWCBj
bG9jayBtdXN0IGJlIGludmVydGVkIHNpbmNlIGl0IGlzIG5vdCBwb3NzaWJsZSB0bwo+ID4gbWVl
dCB0aGUgUkdNSUkgdGltaW5nIHJlcXVpcmVtZW50cyB1c2luZyBvbmx5IHJ4LWludGVybmFsLWRl
bGF5LXBzIG9uCj4gPiB0aGUgTUFDIHRvZ2V0aGVyIHdpdGggdGhlIHN0YW5kYXJkIDIgbnMgZGVs
YXkgb24gdGhlIFBIWS4gVGhlcmVmb3JlLAo+ID4gZXZlbiBvbiBhIHByb3Blcmx5IGRlc2lnbmVk
IGJvYXJkLCBldGgxIHN0aWxsIHJlcXVpcmVzIFJYIGNsb2NrCj4gPiBpbnZlcnNpb24uCj4gPiAK
PiA+IFRoaXMgYmVoYXZpb3VyIGVmZmVjdGl2ZWx5IGJyZWFrcyB0aGUgUkdNSUkgdGltaW5nIGFz
c3VtcHRpb25zIGF0IHRoZQo+ID4gU29DIGxldmVsLgo+ID4gCj4gPiBGb3IgdGhlIFRYIHBhdGgg
b2YgZXRoMSwgdGhlcmUgaXMgYWxzbyBhIHNrZXcgYmV0d2VlbiB0aGUgVFggY2xvY2sKPiA+IGFu
ZCBkYXRhIG9uIHRoZSBNQUMgY29udHJvbGxlciBpbnNpZGUgdGhlIHNpbGljb24uIFRoaXMgc2tl
dyBoYXBwZW5zCj4gPiB0byBiZSBhcHByb3hpbWF0ZWx5IDIgbnMuIFRoZXJlZm9yZSwgaXQgY2Fu
IGJlIGNvbnNpZGVyZWQgdGhhdCB0aGUKPiA+IDIgbnMgZGVsYXkgb2YgVFggaXMgcHJvdmlkZWQg
YnkgdGhlIE1BQywgc28gdGhlIFRYIGlzIGNvbXBsaWFudCB3aXRoCj4gPiB0aGUgUkdNSUkgc3Rh
bmRhcmQuCj4gPiAKPiA+IEZvciAxMC8xMDAgb3BlcmF0aW9uLCB0aGUgYXBwcm94aW1hdGVseSA0
LTUgbnMgc2tldyBpbiB0aGUgY2hpcCBkb2VzCj4gPiBub3QgYnJlYWsgdGhlIHN0YW5kYXJkLiBU
aGUgUkdNSUkgdGltaW5nIHRhYmxlIChTZWN0aW9uIDMuMykgc3BlY2lmaWVzCj4gPiB0aGF0IGZv
ciAxMC8xMDAgb3BlcmF0aW9uIHRoZSBtYXhpbXVtIHZhbHVlIGlzIHVuc3BlY2lmaWVkOgo+ID4g
aHR0cHM6Ly9jb21tdW5pdHkubnhwLmNvbS9wd214eTg3NjU0L2F0dGFjaG1lbnRzL3B3bXh5ODc2
NTQvaW14LXByb2Nlc3NvcnMvMjA2NTUvMS9SR01JSXYyXzBfZmluYWxfaHAucGRmCj4gPiAKPiA+
IER1ZSB0byB0aGUgZXRoMSBzaWxpY29uIGJlaGF2aW9yIGRlc2NyaWJlZCBhYm92ZSwgYSBuZXcg
Y29tcGF0aWJsZQo+ID4gc3RyaW5nICJlc3dpbixlaWM3NzAwLXFvcy1ldGgtY2xrLWludmVyc2lv
biIgaXMgYWRkZWQgdG8gdGhlIGRldmljZQo+ID4gdHJlZS4gVGhpcyBhbGxvd3MgdGhlIGRyaXZl
ciB0byBoYW5kbGUgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gZXRoMQo+ID4gYW5kIGV0aDAgdGhy
b3VnaCBkZWRpY2F0ZWQgbG9naWMuCj4gPiAKPiA+IFRoZSByeC1pbnRlcm5hbC1kZWxheS1wcyBh
bmQgdHgtaW50ZXJuYWwtZGVsYXktcHMgcHJvcGVydGllcyBub3cgdXNlCj4gPiBtaW5pbXVtIGFu
ZCBtYXhpbXVtIGNvbnN0cmFpbnRzIHRvIHJlZmxlY3QgdGhlIGFjdHVhbCBoYXJkd2FyZSBkZWxh
eQo+ID4gcmFuZ2UgKDAtMjU0MCBwcykgYXBwbGllZCBpbiAyMCBwcyBzdGVwcy4gVGhpcyByZWxh
eGVzIHRoZSBiaW5kaW5nCj4gPiB2YWxpZGF0aW9uIGNvbXBhcmVkIHRvIHRoZSBwcmV2aW91cyBl
bnVtLWJhc2VkIGRlZmluaXRpb24gYW5kIGF2b2lkcwo+ID4gcmVncmVzc2lvbnMgZm9yIGV4aXN0
aW5nIERUQnMgd2hpbGUga2VlcGluZyB0aGUgc2FtZSBoYXJkd2FyZSBsaW1pdHMuCj4gPiAKPiA+
IFRyZWF0IHRoZSBSWC9UWCBpbnRlcm5hbCBkZWxheSBwcm9wZXJ0aWVzIGFzIG9wdGlvbmFsLCBi
b2FyZC1zcGVjaWZpYwo+ID4gdHVuaW5nIGtub2JzIGFuZCByZW1vdmUgdGhlbSBmcm9tIHRoZSBl
eGFtcGxlIHRvIGF2b2lkIGVuY291cmFnaW5nCj4gPiB0aGVpciB1c2UuCj4gPiAKPiA+IEluIGFk
ZGl0aW9uLCB0aGUgYmluZGluZyBub3cgaW5jbHVkZXMgYWRkaXRpb25hbCBiYWNrZ3JvdW5kIGlu
Zm9ybWF0aW9uCj4gPiBhYm91dCB0aGUgSFNQIENTUiByZWdpc3RlcnMgYWNjZXNzZWQgYnkgdGhl
IE1BQy4gVGhlIFRYRCBhbmQgUlhEIGRlbGF5Cj4gPiBjb250cm9sIHJlZ2lzdGVycyBhcmUgaW5j
bHVkZWQgc28gdGhlIGRyaXZlciBjYW4gZXhwbGljaXRseSBjbGVhciBhbnkKPiA+IHJlc2lkdWFs
IGNvbmZpZ3VyYXRpb24gbGVmdCBieSB0aGUgYm9vdGxvYWRlci4KPiA+IAo+ID4gQmFja2dyb3Vu
ZCByZWZlcmVuY2UgZm9yIHRoZSBIaWdoLVNwZWVkIFN1YnN5c3RlbSBhbmQgSFNQIENTUiBibG9j
ayBpcwo+ID4gYXZhaWxhYmxlIGluIENoYXB0ZXIgMTAgKCJIaWdoLVNwZWVkIEludGVyZmFjZSIp
IG9mIHRoZSBFSUM3NzAwWCBTb0MKPiA+IFRlY2huaWNhbCBSZWZlcmVuY2UgTWFudWFsLCBQYXJ0
IDQKPiA+IChFSUM3NzAwWF9Tb0NfVGVjaG5pY2FsX1JlZmVyZW5jZV9NYW51YWxfUGFydDQucGRm
KToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9lc3dpbmNvbXB1dGluZy9FSUM3NzAwWC1Tb0MtVGVj
aG5pY2FsLVJlZmVyZW5jZS1NYW51YWwvcmVsZWFzZXMKPiA+IAo+ID4gVGhlcmUgYXJlIGN1cnJl
bnRseSBubyBpbi10cmVlIHVzZXJzIG9mIHRoZSBFSUM3NzAwIEV0aGVybmV0IGRyaXZlciwgc28K
PiA+IHRoZXNlIGNoYW5nZXMgYXJlIHNhZmUuCj4gPiAKPiA+IEZpeGVzOiA4ODhiZDBlY2E5M2Mg
KCJkdC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBEb2N1bWVudCBmb3IgRUlDNzcwMCBTb0Mi
KQo+ID4gU2lnbmVkLW9mZi1ieTogWmhpIExpIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgo+
IAo+IEtyenlzenRvZiBtaWdodCBub3QgeWV0IGJlIGhhcHB5IHdpdGggdGhlIGNvbXBhdGlibGUg
bmFtaW5nLCBidXQgZnJvbSBteQo+IHBvdjoKPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4K

