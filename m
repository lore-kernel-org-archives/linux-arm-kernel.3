Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91255C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW+tvRQPk481HdTwPz8zkkWSMpWsfa6tS8dyetXXOrU=; b=Xjd1PaIRkh6nSZWMUNauzGluBP
	d7p4upE8Ky8ULHd08IEFpvTu+8BHMisTT0KrYmWHc61JqHkeMCysUsmoSjNg4sPVLbKrMHONDJQxw
	OH4eL6Vzd0ovbKDgsdU6eId3J1VJ6wQBDAz1FFwHaB5kQeQgMiHE28ygmE424u7YkJeGtUU4w3dl2
	+g/UQ18lxr00I86POvrDMU+7Sn0TteFZSPAwPshfHbDS34/GkyOLgKAoE74yybcB9Ei+RoP6n8kYA
	z5K737b10fIOJ9Fd3lePajK5sgTRBmowIRkuhbHOdQswI8jRK9lLYrcNMCaDZZ1jDOskX1X+uJ4T7
	nVGNDOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpn76-0000000CbA0-0byo;
	Fri, 31 Jul 2026 13:17:24 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpn71-0000000Cb7J-0xSB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 13:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785503832; bh=gW+tvRQPk481HdTwPz8zkkWSMpWsfa6tS8dyetXXOrU=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=ewV+8ARlCn7ZAMKcE79lizjisbfeU2oczTzpc0TFED9y8m2W5Q9/Sq0Wrs36zYZrc
	 3KprUZeCURqox5ekUEh57UwE1pr//ENACRGlP1R3xkcvtfF4RxWEQf78d4TQIyv10p
	 oIpqCvlVFU1JsSWvz2CdzmS/FEQOpiNblyhtLYfI=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-XMAILINFO: MhgqsjsLyB9lgglpvTRWkq4RtQwA360U8xUnh2PTRxSK+CQBsNgNq1J1FIRxgq
	 r218z1HFIuJ9IRcNN5zmmaMt/+Swh/pTr+m/FmKmAGPYysj39rXWqFCEG9LDTiz/QS0L5Mt5TDq12
	 hK8AZIhchdjCP3Y10d3BrioMfVynEtIteUUrAJiEbx36wL1yuA4tr38v1xSg9J7UUf1Ph5rDVJocu
	 S6a9oD38B8YhsvvwpOCwbJ0ru4XfWofU59ZHPAeP6AylfuSJ12t2gbay4LCiC8XwWLe+g6Vi2xqdn
	 JYy2A4ISNpdjEcdoKmWT2gTo9aKVmZ3rNFqtnFOd015HhD8uqW/btnIuxVBiaBD1fK3slEOiya8QP
	 /Os9yMk4OvS+HTRwyI/WWIf+GQ8vyyt8p/gOiAimMRtVh6g0oOztKvqd/VlWM+hxGtpglIfa9U7aa
	 7Q0AoYrM0EzA9A0jqNO9IFtTr+m6ZzpV40hmGYh06zr49fvC+ri5ridNtnHELqCFSf1YxxZWNzx4t
	 1s/g6FdM8Mj7tzrqc5yKJJMu9TSMyFUCcme2wdjPZoHq2vZw2zgq01YMDjKrR/KLF9Ijm5V7WuaCq
	 fW04sxTl5GSnFtdwlK/6uRAx/UkQwWDt+GqomKu8rjDu59JJPVRTbcLP5kLn1q2/TzuVyL0XnVBJe
	 9rfEdH/l1xFLif18WpiWQXP4mvFIdnR60a7wrKY+xZ0M5pV74OBX4QC6nP5H8L1E8Y7FB4EB6lrk+
	 HmMzyPoe8rq+3thLJUbXhMtf87Ho+akGM06EE0d/kC52iRq/pEmQmwyupb7BTcMlD31DNapja5TPH
	 8LFV1Eg/QqmyhzBhJUSuSN6ZpLJEzgUN5s3Ex7lbSNBJmrrJHS4P1ewnVzJHkxck0rrHt7r/p4d9G
	 kERH+8anl8MLPpkrwcCnsS/tdDnL9YXtZEDChwvx3W+p1rxxb3DUG9GNrlvp+w9GJxSOU4cGxAa4Q
	 O1wHEbJ4Q29JHduTzjfV24N/6YaJc5OAzeS490Y2lDYDP/jXcAq6Jh3Dbn3iyP9uOWHRUZDUFFKvy
	 vzpgMqmCwmtuZWjMOuk/9eRMhA9ajLpmh5waTNNmqut1OxsvFQDd0YfNaVutwqokygINboFFp86cn
	 9D8=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>
Cc: "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v6 2/4] can: rockchip: add RK3588 CAN support
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 31 Jul 2026 21:17:10 +0800
X-Priority: 3
Message-ID: <tencent_5AC853C017A2AE1F5B13110D854C79C2FF06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_7BAA0052C402BFFD26291A64198084E39107@qq.com>
 <tencent_207E464D12344B3228096E23A001D6882508@qq.com>
 <20260731-tall-camouflaged-earthworm-e1a7d0-mkl@pengutronix.de>
 <tencent_A3698A465C4621E164443B0005D1CC6FAE05@qq.com>
	<20260731-precise-functional-lobster-cd779f-mkl@pengutronix.de>
In-Reply-To: <20260731-precise-functional-lobster-cd779f-mkl@pengutronix.de>
X-QQ-mid: xmsezb41-0t1785503830tg7jpmm29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_061721_546568_9B9BDA83 
X-CRM114-Status: GOOD (  18.32  )
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

SGkgTWFyYywKCj4gPsKgPsKgQ2FuwqB5b3XCoGF0dGFjaMKgdGhlwqBUREPCoHRvwqB0aGXC
oENBTsKgZnJhbWV3b3JrP8KgU2VlwqBjb21taXTCoDVlMTY2MzgxMGUxMQo+ID7CoD7CoCgi
Y2FuOsKgbWNwMjUxeGZkOsKgZml4wqBUREPCoHNldHRpbmfCoGZvcsKgbG93wqBkYXRhwqBi
aXTCoHJhdGVzIikuwqBBbmTCoGNoZWNrwqBpZgo+ID7CoD7CoENBTi1GRMKgd29ya3PCoG9u
wqB0aGXCoHJrMzU4OMKgd29ya3M/Cj4gPgo+ID7CoENvdWxkwqB3ZcKgbGVhdmXCoHRoZcKg
UkszNTg4wqBUREPCoHN1cHBvcnTCoG91dMKgb2bCoHRoaXPCoHBhdGNowqBzZXJpZXPCoGZv
csKgbm93Pwo+IAo+IC4uYW5kwqBtYXJrwqB0aGXCoHJrMzU4OMKgYXPCoFJLQ0FORkRfUVVJ
UktfQ0FORkRfQlJPS0VOwqBmb3LCoG5vdz/CoEZpbmXCoHdpdGjCoG1lLgoKSSBoYXZlIGZp
bmlzaGVkIHRlc3RpbmcgdGhlIENBTi1GRCBUREMgaW50ZWdyYXRpb24gb24gUkszNTg4LgoK
RW5hYmxpbmcgVERDIG1ha2VzIHRoZSB0cmFuc21pdHRlciBlbnRlciBidXMtb2ZmIGZvciBl
dmVyeSBURENPIHZhbHVlCnRlc3RlZC4gVGhpcyBpbmNsdWRlcyB0aGUgZnJhbWV3b3JrIHZh
bHVlIChURENPPTQ4KSwgVERDTz0wLCBhbmQgdGhlCm5vbi16ZXJvIHZhbHVlcyAxLCA4LCAx
NiwgMjQsIDMyLCA0MCwgNDggYW5kIDU2LiBXaXRoIFREQ089NjMsIG9ubHkgb25lCmZyYW1l
IHdhcyByZWNlaXZlZCBkdXJpbmcgYSAxMCBzZWNvbmQgdGVzdCwgc28gdGhhdCBzZXR0aW5n
IGlzIG5vdCB1c2FibGUuCgpJIGNoZWNrZWQgdGhlIHJlZ2lzdGVyIGRlZmluaXRpb24gYWdh
aW5zdCBSb2NrY2hpcCBSSzM1ODggVFJNClYxLjAtUGFydDEtMjAyMjAzMDkucGRmLiBUaGUg
ZHJpdmVyIHVzZXMgQ0FOX1RSQU5TTUlUX0RFTEFZX0NPTVBFTlNBVElPTiBhdApvZmZzZXQg
MHgxMDgsIHdpdGggdGRjX29mZnNldCBpbiBiaXRzIDY6MSBhbmQgdGRjX2VuYWJsZSBpbiBi
aXQgMCwgd2hpY2gKbWF0Y2hlcyB0aGUgVFJNLiBUaHVzLCB0aGUgZmFpbHVyZSBpcyBub3Qg
ZXhwbGFpbmVkIGJ5IGFuIGluY29ycmVjdCByZWdpc3RlcgphZGRyZXNzIG9yIGZpZWxkIGRl
ZmluaXRpb24uCgpUaGUgdGVzdCBzZXR1cCB3YXM6CgogIEJvYXJkOiAgICAgICAgICAgICBl
bWJlZGZpcmUscmszNTg4LWx1YmFuY2F0LTVpbwogIENBTiBjbG9jazogICAgICAgICAzMDAg
TUh6CiAgTm9taW5hbCBiaXRyYXRlOiAgIDUwMCBrYml0L3MKICBEYXRhIGJpdHJhdGU6ICAg
ICAgNSBNYml0L3MKICBTYW1wbGUgcG9pbnRzOiAgICAgODAlIG5vbWluYWwsIDgwJSBkYXRh
CiAgQnVzOiAgICAgICAgICAgICAgIGNhbjAgYW5kIGNhbjEgZGlyZWN0bHkgY29ubmVjdGVk
LCA2MCBPaG0gdGVybWluYXRpb24KCldpdGggVERDIGRpc2FibGVkLCBhYm91dCAyOSw3NzUg
ZnJhbWVzIHdlcmUgcmVjZWl2ZWQgaW4gdGhyZWUgc2Vjb25kcyB3aXRoCm5vIGJ1cyBlcnJv
cnMuIFdpdGggVERDIGVuYWJsZWQsIGNhbjAgdHlwaWNhbGx5IHJlYWNoZWQgYnVzLW9mZiBh
ZnRlciBhYm91dAoxNS0zMSBidXMgZXJyb3JzLgoKVGhpcyBpcyBhIHByZWxpbWluYXJ5IGlu
ZGljYXRpb24gb2YgYSBwcm9ibGVtIGluIHRoZSBSSzM1ODggQ0FOIElQIFREQwpwYXRoLCBh
bHRob3VnaCBpdCBpcyBub3Qgc3VmZmljaWVudCB0byBwcm92ZSBhIHNpbGljb24gZGVmZWN0
LiBJbgpwYXJ0aWN1bGFyLCB0aGUgaGFyZHdhcmUtbWVhc3VyZWQgdHJhbnNtaXR0ZXIgZGVs
YXkgKFREQ1YpIGlzIG5vdCBvYnNlcnZhYmxlCnRocm91Z2ggdGhlIHJlZ2lzdGVycyBkZXNj
cmliZWQgYnkgdGhlIFRSTSwgc28gdGhlIFREQyBvZmZzZXQgc2VtYW50aWNzCnN0aWxsIG5l
ZWQgdG8gYmUgdmVyaWZpZWQgaW5kZXBlbmRlbnRseS4KClREQyBpcyBub3QgYSBtYW5kYXRv
cnkgZmVhdHVyZSBmb3IgYSBDQU4tRkQgaW1wbGVtZW50YXRpb24uIEl0IGNvbXBlbnNhdGVz
CnRoZSBUWC10by1SWCBsb29wIGRlbGF5IHdoZW4gdGhhdCBkZWxheSB3b3VsZCBvdGhlcndp
c2UgY29uc3VtZSB0aGUgdGltaW5nCm1hcmdpbiBiZWZvcmUgdGhlIG5vcm1hbCBzYW1wbGUg
cG9pbnQuIFdoZXRoZXIgaXQgbXVzdCBiZSBlbmFibGVkIGRlcGVuZHMgb24KdGhlIGNvbXBs
ZXRlIGhhcmR3YXJlIHBhdGgsIGluY2x1ZGluZyB0aGUgY29udHJvbGxlciwgdHJhbnNjZWl2
ZXIsIFBDQiBhbmQKYnVzLiBJdCBpcyB0aGVyZWZvcmUgbm90IHJlcXVpcmVkIHNvbGVseSBi
ZWNhdXNlIENBTi1GRCBvciBhIHBhcnRpY3VsYXIKZGF0YSBiaXRyYXRlIGlzIHVzZWQuCgpP
biB0aGUgYm9hcmQgdXNlZCBmb3IgdGhpcyB0ZXN0LCBDQU4tRkQgcnVucyByZWxpYWJseSBh
dCA1IE1iaXQvcyB3aXRoIFREQwpkaXNhYmxlZCBhbmQgbm8gbG9zdCBmcmFtZXMuIFRoaXMg
ZGVtb25zdHJhdGVzIHRoYXQgUkszNTg4IHN1cHBvcnRzIENBTi1GRCwKd2hpbGUgdGhlIG1h
eGltdW0gdXNhYmxlIGRhdGEgYml0cmF0ZSBzdGlsbCBkZXBlbmRzIG9uIHRoZSBib2FyZCBk
ZXNpZ24gYW5kCml0cyBUWC10by1SWCBkZWxheS4gQm9hcmRzIHdpdGggYSBsb25nZXIgZGVs
YXkgbWF5IG5lZWQgYSBsb3dlciBkYXRhIGJpdHJhdGUsCmp1c3QgYXMgZGlmZmVyZW50IENB
TiB0cmFuc2NlaXZlcnMgaGF2ZSBkaWZmZXJlbnQgbWF4aW11bSBkYXRhLXJhdGUKc3BlY2lm
aWNhdGlvbnMgKGZvciBleGFtcGxlLCA4IE1iaXQvcyBmb3Igc29tZSBkZXZpY2VzIGFuZCA1
IE1iaXQvcyBmb3IKb3RoZXJzKS4KCkluIG15IG9waW5pb24sIGVuYWJsaW5nIENBTi1GRCBz
dXBwb3J0IG9uIFJLMzU4OCBpcyBpbmRlcGVuZGVudCBvZiBUREMuClREQyBpcyBhbiBvcHRp
bWl6YXRpb24gZm9yIGhhcmR3YXJlIHBhdGhzIHRoYXQgbmVlZCBhZGRpdGlvbmFsIFRYLXRv
LVJYCmRlbGF5IGNvbXBlbnNhdGlvbiwgcmF0aGVyIHRoYW4gYSBwcmVyZXF1aXNpdGUgZm9y
IENBTi1GRCBvcGVyYXRpb24uIEkgd291bGQKdGhlcmVmb3JlIHN0aWxsIGxpa2UgdG8gZW5h
YmxlIENBTi1GRCBzdXBwb3J0IGZvciBSSzM1ODggaW4gdGhpcyBzZXJpZXMgd2hpbGUKa2Vl
cGluZyBUREMgZGlzYWJsZWQuIFREQyBzdXBwb3J0IGNhbiBiZSBpbnZlc3RpZ2F0ZWQgc2Vw
YXJhdGVseSBpbiBhCmZvbGxvdy11cCBwYXRjaCBvbmNlIGl0cyBiZWhhdmlvciBoYXMgYmVl
biB1bmRlcnN0b29kLgoKQmVzdCByZWdhcmRzLApDdW5oYW8K


