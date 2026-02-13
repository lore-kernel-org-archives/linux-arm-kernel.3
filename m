Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8371EF48DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 07:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnmsuRPgnKCsUILPW+QojxZQhQYSal/NWozXZ/TUwRU=; b=NnTJeNPZ3ZGFkhFZH0ATSk3G4N
	Aoy/Qi5wXHrrZGS9tbzBgaakIgHOuvcc4T4POIL/VGOA+OFK8pfm2kCG0Q2OU1mBnQw90LJWq5jY8
	j8tUKfvWRc6fLMBAVdLB5/zOmP0tXGltVJhewjJg4lTPVlpacq+FhsWZEuE2opaQHjFjb8IKemuLf
	Uz9Ye2m7678ynx5/n27LtQdDPX7DqjC53q22E9GGuOccrwzhM5rqlidOsFXOoPgoLl9DGkY1DUQQW
	Wy5bAJEq6rZrv3k/fiQlNFbCu7iumMdF2DtezomhlLzgMR8FIp3a9typRm+ZjsMsNUF7v3KMpJE/f
	9gOQst+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnIK-000000035Oh-3ufe;
	Fri, 13 Feb 2026 07:08:52 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnIH-000000035Nm-0uSu;
	Fri, 13 Feb 2026 07:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=dnmsuRPgnKCsUILPW+QojxZQhQYSal/NWozXZ/TUwRU=; b=L
	xssWcgexiUWpxvlhsK6Cx0Ano5Yl7WLP644JJFBCgiZBJGpRyfvvAKUAr6ACPV+V
	6GLztXJeHyTcSwdIF/zkOzPFLHbFVRViKn18n7uOmf7IC8M0+mLQZ/h3D3UtgDzE
	HBYMWYX4FJrWICA9cCnHbp3B8i+DuADLN5fKksAWhM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Fri, 13 Feb 2026 15:07:54 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 13 Feb 2026 15:07:54 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Louis Chauvet" <louis.chauvet@bootlin.com>,
	"Haneen Mohammed" <hamohammed.sa@gmail.com>,
	"Melissa Wen" <melissa.srw@gmail.com>,
	"Robert Mader" <robert.mader@collabora.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re:Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <67fb66b7-eee7-4109-8127-385593e88425@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
 <2750b73.10b0.19ba61052c8.Coremail.andyshrk@163.com>
 <9e4c8514-63e9-4ff7-85b1-b5af7dff9a2d@collabora.com>
 <67fb66b7-eee7-4109-8127-385593e88425@collabora.com>
X-CM-CTRLMSGS: 2tI/YHBsdXM9MTc3MDk2NjQ3MzgzM18yNmE0NDE0ZTE4ZjU3NWY3YmQzN2ZmZ
 jQyY2U5ZTYyOQ==
X-NTES-SC: AL_Qu2cAvWduUws4iaeZOkfmUgWjuw/WsG1v/Ul1YBSP556jCnr5x0aRV1hGUrS/tKPJxKisyadUBxX49ZlWK92fa4scpLAqig+KXXFVQ6i7bRmRw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <539febc7.2cf9.19c55d3dfb0.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iCgvCgD3n_3KzY5pp4hqAA--.64472W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7gqjAmmOzcrD+QAA3f
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_230849_639532_A7E174DB 
X-CRM114-Status: GOOD (  15.17  )
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

SGVsbG8gQ3Jpc3RpYW7vvIwKCkF0IDIwMjYtMDEtMTYgMjM6MjI6MTEsICJDcmlzdGlhbiBDaW9j
YWx0ZWEiIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5PbiAxLzEw
LzI2IDExOjU4IEFNLCBDcmlzdGlhbiBDaW9jYWx0ZWEgd3JvdGU6Cj4+IEhpIEFuZHksCj4+IAo+
PiBPbiAxLzEwLzI2IDY6MDAgQU0sIEFuZHkgWWFuIHdyb3RlOgo+Pj4KPj4+Cj4+PiBIZWxsbyBD
cmlzdGlhbiwKPj4+IEF0IDIwMjUtMTItMjAgMDU6NDc6MDEsICJDcmlzdGlhbiBDaW9jYWx0ZWEi
IDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+Pj4gVGhlIFJvY2tj
aGlwIFZPUDIgZGlzcGxheSBjb250cm9sbGVyIGFsbG93cyBjb25maWd1cmluZyB0aGUgYmFja2dy
b3VuZAo+Pj4+IGNvbG9yIG9mIGVhY2ggdmlkZW8gb3V0cHV0IHBvcnQuCj4+Pj4KPj4+PiBTaW5j
ZSBhIHByZXZpb3VzIHBhdGNoIGludHJvZHVjZWQgdGhlIEJBQ0tHUk9VTkRfQ09MT1IgQ1JUQyBw
cm9wZXJ0eSwKPj4+PiB3aGljaCBkZWZhdWx0cyB0byBzb2xpZCBibGFjaywgbWFrZSB1c2Ugb2Yg
aXQgd2hlbiBwcm9ncmFtbWluZyB0aGUKPj4+PiBoYXJkd2FyZS4KPj4+Pgo+Pj4+IE5vdGUgdGhl
IG1heGltdW0gcHJlY2lzaW9uIGFsbG93ZWQgYnkgdGhlIGRpc3BsYXkgY29udHJvbGxlciBpcyAx
MGJwYywKPj4+PiB3aGlsZSB0aGUgYWxwaGEgY29tcG9uZW50IGlzIG5vdCBzdXBwb3J0ZWQsIGhl
bmNlIGlnbm9yZWQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDcmlzdGlhbiBDaW9jYWx0ZWEg
PGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPgo+Pj4+IC0tLQo+Pj4+IGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgMTMgKysrKysrKysrKysrLQo+
Pj4+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5oIHwgIDQgKysr
Kwo+Pj4+IDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMK
Pj4+PiBpbmRleCA0OThkZjBjZTQ2ODAuLjNhMjMyZDBkNGFjYiAxMDA2NDQKPj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+Pj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+Pj4gQEAgLTE1NTQs
NiArMTU1NCw3IEBAIHN0YXRpYyB2b2lkIHZvcDJfcG9zdF9jb25maWcoc3RydWN0IGRybV9jcnRj
ICpjcnRjKQo+Pj4+IAlzdHJ1Y3Qgdm9wMl92aWRlb19wb3J0ICp2cCA9IHRvX3ZvcDJfdmlkZW9f
cG9ydChjcnRjKTsKPj4+PiAJc3RydWN0IHZvcDIgKnZvcDIgPSB2cC0+dm9wMjsKPj4+PiAJc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUgPSAmY3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGU7
Cj4+Pj4gKwl1NjQgYmdjb2xvciA9IGNydGMtPnN0YXRlLT5iYWNrZ3JvdW5kX2NvbG9yOwo+Pj4+
IAl1MTYgdnRvdGFsID0gbW9kZS0+Y3J0Y192dG90YWw7Cj4+Pj4gCXUxNiBoZGlzcGxheSA9IG1v
ZGUtPmNydGNfaGRpc3BsYXk7Cj4+Pj4gCXUxNiBoYWN0X3N0ID0gbW9kZS0+Y3J0Y19odG90YWwg
LSBtb2RlLT5jcnRjX2hzeW5jX3N0YXJ0Owo+Pj4+IEBAIC0xNTk5LDcgKzE2MDAsMTEgQEAgc3Rh
dGljIHZvaWQgdm9wMl9wb3N0X2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4+Pj4gCQl2
b3AyX3ZwX3dyaXRlKHZwLCBSSzM1NjhfVlBfUE9TVF9EU1BfVkFDVF9JTkZPX0YxLCB2YWwpOwo+
Pj4+IAl9Cj4+Pj4KPj4+PiAtCXZvcDJfdnBfd3JpdGUodnAsIFJLMzU2OF9WUF9EU1BfQkcsIDAp
Owo+Pj4+ICsJLyogQmFja2dyb3VuZCBjb2xvciBpcyBwcm9ncmFtbWVkIHdpdGggMTAgYml0cyBv
ZiBwcmVjaXNpb24gKi8KPj4+PiArCXZhbCA9IEZJRUxEX1BSRVAoUkszNTY4X1ZQX0RTUF9CR19f
RFNQX0JHX1JFRCwgRFJNX0FSR0I2NF9HRVRSKGJnY29sb3IpID4+IDYpOwo+Pj4+ICsJdmFsIHw9
IEZJRUxEX1BSRVAoUkszNTY4X1ZQX0RTUF9CR19fRFNQX0JHX0dSRUVOLCBEUk1fQVJHQjY0X0dF
VEcoYmdjb2xvcikgPj4gNik7Cj4+Pgo+Pj4+ICsJdmFsIHw9IEZJRUxEX1BSRVAoUkszNTY4X1ZQ
X0RTUF9CR19fRFNQX0JHX0JMVUUsIERSTV9BUkdCNjRfR0VUQihiZ2NvbG9yKSA+PiA2KTsKPj4+
Cj4+Pgo+Pj4gdGhlIGJpdDMxIG9mICBSSzM1NjhfVlBfRFNQX0JHICBpcyBiZ19kaXNwbGF5X2Vu
77yMIHRoYXQgbWVhbnMgd2hlbiB3ZSBzZXQgYSAKPj4+IGJhY2tncm91bmQgY29sb3IsIHdlIHNo
b3VsZCBzZXQgdGhpcyBiZ19kaXNwbGF5X2VuIGJpdC4KPgo+SSBwZXJmb3JtZWQgc2V2ZXJhbCB0
ZXN0cyBvbiBteSBST0NLIDNBIChSSzM1NjgpLCBST0NLIDREIChSSzM1NzYpIGFuZCBST0NLIDVC
Cj4oUkszNTg4KSBib2FyZHMgYW5kIG5vdGljZWQgdGhhdCBieSBzZXR0aW5nIGJnX2Rpc3BsYXlf
ZW4gYml0IHRvIDEgb3IgMCBkb2Vzbid0Cj5oYXZlIGFueSBpbmZsdWVuY2Ugb24gUkszNTY4IGFu
ZCBSSzM1NzYsIHRoZSBiYWNrZ3JvdW5kIGNvbG9yIGlzIGFsd2F5cyBhY3RpdmUKPmFuZCBjYW5u
b3QgYmUgZGlzYWJsZWQuCj4KPkhvd2V2ZXIsIGZsaXBwaW5nIHRoZSBiaXQgdG8gMSBvbiBSSzM1
ODggaGFzIHRoZSB1bmV4cGVjdGVkIGVmZmVjdCBvZiBjb3ZlcmluZwo+dGhlIHdob2xlIHNjcmVl
biB3aXRoIHRoZSBjb25maWd1cmVkIGNvbG9yLCBldmVuIHdoZW4gdGhlcmUncyBhbiBhY3RpdmUg
cGxhbmUKPmRpc3BsYXllZCBvbiB0b3AuIFN3aXRjaGluZyBiYWNrIHRvIDAgbWFrZXMgaXQgd29y
ayBhcyBleHBlY3RlZC4KPgo+VGhlcmVmb3JlIEkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgdGhpcyBw
YXRjaCBhcyBpcywgdW5sZXNzIHRoZXJlJ3Mgc29tZXRoaW5nIGVsc2UKPndlJ3JlIG1pc3Npbmcg
aGVyZS4KPgo+Pj4gVGhlIGRlZmF1bHQgdmFsdWUgb2YgdGhpcyBiaXQgaXMgMSwgd2hpY2ggZXhw
bGFpbnMgd2h5IHRoZSBwYXRjaCBjdXJyZW50bHkgd29ya3MgCj4+PiBwcm9wZXJseSBldmVuIHRo
b3VnaCBpdCBkb2Vzbid0IHNldCBiaXQzMS4KPj4gCj4+IEZvciBzb21lIHJlYXNvbiwgdGhlIFJL
MzU4OCBUUk0gaW5kaWNhdGVzIDB4MCBmb3IgdGhlIHJlc2V0IHZhbHVlLiAgSSBhc3N1bWUKPj4g
dGhhdCdzIGEgbWlzdGFrZSwgYXMgUkszNTc2IFRSTSBzaG93cyAweDEuCj4KPkNvbnNpZGVyaW5n
IHRoZSBvYnNlcnZhdGlvbiBhYm92ZSwgaXQga2luZGEgbWFrZXMgc2Vuc2Ugbm93IGZvciBSSzM1
ODggdG8KPmRlZmF1bHQgdG8gMC4KCiAgIEkgZnVydGhlciBjb25maXJtZWQgd2l0aCBvdXIgSUMg
dGVhbTogZm9yIFJLMzU4OCwgUkszNTI4LCBhbmQgUkszNTYyLCBpZiB0aGUgZGlzcGxheV9lbmJp
dCBpcyBzZXQsIHRoZSBiYWNrZ3JvdW5kIGNvbG9yIHdpbGwgaW5kZWVkIGNvdmVyIGFsbCBsYXll
cnMuIAogICBGb3Igb3RoZXIgY2hpcHMsIHRoaXMgYml0IGhhcyBubyBlZmZlY3QuCiAgIFNvIEFD
SwoKPgo=

