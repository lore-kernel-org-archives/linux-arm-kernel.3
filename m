Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E80C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 06:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3Z4Xarq1tuQBhaaqWTW8nAq+1+kB87I8bwIR1VHPJQ=; b=fBk7XvfXqxMzxpA5K1CimA9NU2
	p2bdcg71Bi5WwAgmHK4/FNvlC7LkkefnOaHUat25o0pQLq4gvalFoawpoKpZP1mv4q0REZpcYId8f
	OJF2AtMo+boJhYw+oi1U/9xmM6WBa4nWU/feRGg+AS04ASScxNwH/uvB+kOV1xiYQBLWKpUZbV3qS
	Ejoguk/YThWM2wCbuSOkMrL+HqkAewLp3iq2PBBAgHfHhr9EZaZ9RN9wpqSP4zEPIctqqTNwxDzHa
	9wq9Vag2v+WMmxPcnnfQX2TkbtVYPMj8z3fL7E/2+8c7eKMNh/Xz470dwCKEGBGze8ndyOw17IRut
	ewVDddVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2OvV-00000006HPe-2H9a;
	Wed, 09 Apr 2025 06:28:45 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Oti-00000006HBe-24xc;
	Wed, 09 Apr 2025 06:26:55 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-736b350a22cso5704405b3a.1;
        Tue, 08 Apr 2025 23:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744180013; x=1744784813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3Z4Xarq1tuQBhaaqWTW8nAq+1+kB87I8bwIR1VHPJQ=;
        b=M71kFi48BT1MgB70QlXrMkwPGs9WrnhMHnCy9bBjjbsYl+G1sqV94OR19eGo16aWeL
         qO7hGZi/43MlVJDkGM7zLmotGZqmkuaX9vfASvsrZ/avzzvVgZE1+kjVuIPDgwo9mpQn
         OH308anA4b1pwyK6IJk7oyZHvjD13u/EDx4+fr6pQMZfow81ikd0hKaKsH6VmpuBCPg3
         2h7EtKEuzVI/MKU/b5ucd4xPNK+pY+9LU9epgM4hiXDUDXSXbVJDFeX/vM7GPWrzeu9a
         PKrm+CNsl9yG5WYHUNvv8llYTaURDWE6e62zO6gwENN/8jdAOwaIyuOH46hisd/KpThq
         tt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180013; x=1744784813;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/3Z4Xarq1tuQBhaaqWTW8nAq+1+kB87I8bwIR1VHPJQ=;
        b=kNlSTwWeONW8TZmUM5vX10kr0vprBeJcmJRL/P8mtneXdjMJACKIEMGULO+rLRzrkK
         O6QLD+gQ2NmJQa+ca1OhlRBgPEzdDG3Hqa/1GaxyHnwVXuEq9ED5R0TyAgaTl6mWF2UW
         2wgEF5u8K50Jt6TFtEc/VOH7alvN5h1/uzLbb5X45jG9UNL3YP2D2L81Ag0401t26QLP
         1QKCVF7h1VQPh/ylNh95oGtk0OZ42oNASDSqfpRrigxshwmZcKsNTg80YgrHC+cEKZgj
         PzFg2e+zJfCMJG7Qwqnljd5X5HXpjAQxu71x9vORTLgfsIcXCEwJ6PnsfscOHDd5j47H
         6crw==
X-Forwarded-Encrypted: i=1; AJvYcCWP+7M+UvOvAFjYloerjn9YIZSP/r6x5kIcW2d55AP7VycT0eeRAcwWs39A9obJiYtb/H0WRQo1lUgh6WA=@lists.infradead.org, AJvYcCWQ95PD5OH1Kke6deQOSmbPcH+Vob4fS36XtWDCORQndT7AzF4gSMXDZRgxUy0iDViyoklNMM3RnMnvB7b5LpTE@lists.infradead.org
X-Gm-Message-State: AOJu0YzHeumaDf1OMeYVeHlDmS53qa/I+GUFJYwh4sBf9bsh/CtPkkzz
	EUZDRjD3nTJYY/zNrkpBn8TwD2XwIqyYZVtJnp5Z3jR92CyO1i5L
X-Gm-Gg: ASbGncubKWo59r1jSjWpxH52QxuccZokT66Lxbmod4CH2E3+FS2MI/cADTAuKjlDylb
	2QVGziZ/di0LzkKq1JLJKsHoLG89s/bja1FERxlISDTCPYKdf3yWr4xOfl/fWcH9jluZSKSes3Z
	DimNs9TsMOfRoYWAWDHMHGSK+dw2Z7zKNBb3im8LzpQ+xWLjJO4k20lH5Qc17OdTkM9JmLDHaQ1
	FYqEcH7CJuADyxAhjha7zFMtZ/oiXS6aNLjBAVzbIsxonj7BjEZrJ6t+ouBcptzgbi4992szSys
	Wepl9azFwcuhKSGw2KE1R0mkPgSQBVLc6o/jsytutOQ1aKxmwkm1H9P8yDpprg6qRH3zEtDqaJy
	ObO5YtCwphv8iQRLHe7YnB7Q=
X-Google-Smtp-Source: AGHT+IGrx+0fnZn+0LBw/cUv76G2E7ObwLXuSnUaIiBaCUhSms2DnAP0T+H1BXT4eMhmnrXlDWCCAw==
X-Received: by 2002:a05:6a00:2e0f:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-73bae551295mr2257466b3a.21.1744180013348;
        Tue, 08 Apr 2025 23:26:53 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e4f768sm489551b3a.142.2025.04.08.23.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:26:52 -0700 (PDT)
Date: Wed, 09 Apr 2025 15:26:45 +0900 (JST)
Message-Id: <20250409.152645.2045309190127414357.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v4 4/4] rust: Add warn_on macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgiDx5CQQMv=k=ejFYGM=ey1-dgQ44s1Ej1k2+mL7vnZaA@mail.gmail.com>
References: <20250305110814.272792-1-fujita.tomonori@gmail.com>
	<20250305110814.272792-5-fujita.tomonori@gmail.com>
	<CAH5fLgiDx5CQQMv=k=ejFYGM=ey1-dgQ44s1Ej1k2+mL7vnZaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_232654_553241_B623EDA0 
X-CRM114-Status: GOOD (  17.54  )
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

T24gVHVlLCA4IEFwciAyMDI1IDE1OjU1OjM4ICswMjAwDQpBbGljZSBSeWhsIDxhbGljZXJ5aGxA
Z29vZ2xlLmNvbT4gd3JvdGU6DQoNCj4gT24gV2VkLCBNYXIgNSwgMjAyNSBhdCAxMjoxMOKAr1BN
IEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6DQo+
Pg0KPj4gQWRkIHdhcm5fb24gbWFjcm8sIHVzZXMgdGhlIEJVRy9XQVJOIGZlYXR1cmUgKGxpYi9i
dWcuYykgdmlhIGFzc2VtYmx5DQo+PiBmb3IgeDg2XzY0L2FybTY0L3Jpc2N2Lg0KPj4NCj4+IFRo
ZSBjdXJyZW50IFJ1c3QgY29kZSBzaW1wbHkgd3JhcHMgQlVHKCkgbWFjcm8gYnV0IGRvZXNuJ3Qg
cHJvdmlkZSB0aGUNCj4+IHByb3BlciBkZWJ1ZyBpbmZvcm1hdGlvbi4gVGhlIEJVRy9XQVJOIGZl
YXR1cmUgY2FuIG9ubHkgYmUgdXNlZCBmcm9tDQo+PiBhc3NlbWJseS4NCj4+DQo+PiBUaGlzIHVz
ZXMgdGhlIGFzc2VtYmx5IGNvZGUgZXhwb3J0ZWQgYnkgdGhlIEMgc2lkZSB2aWEgQVJDSF9XQVJO
X0FTTQ0KPj4gbWFjcm8uIFRvIGF2b2lkIGR1cGxpY2F0aW5nIHRoZSBhc3NlbWJseSBjb2RlLCB0
aGlzIGFwcHJvYWNoIGZvbGxvd3MNCj4+IHRoZSBzYW1lIHN0cmF0ZWd5IGFzIHRoZSBzdGF0aWMg
YnJhbmNoIGNvZGU6IGl0IGdlbmVyYXRlcyB0aGUgYXNzZW1ibHkNCj4+IGNvZGUgZm9yIFJ1c3Qg
dXNpbmcgdGhlIEMgcHJlcHJvY2Vzc29yIGF0IGNvbXBpbGUgdGltZS4NCj4+DQo+PiBTaW1pbGFy
bHksIEFSQ0hfV0FSTl9SRUFDSEFCTEUgaXMgYWxzbyB1c2VkIGF0IGNvbXBpbGUgdGltZSB0bw0K
Pj4gZ2VuZXJhdGUgdGhlIGFzc2VtYmx5IGNvZGU7IG9ianRvb2wncyByZWFjaGFibGUgYW5vdGF0
aW9uIGNvZGUuIEl0J3MNCj4+IHVzZWQgZm9yIG9ubHkgYXJjaGl0ZWN0dXJlcyB0aGF0IHVzZSBv
Ymp0b29sLg0KPj4NCj4+IEZvciBub3csIExvb25nYXJjaCBqdXN0IHVzZXMgYSB3cmFwcGVyIGZv
ciBXQVJOIG1hY3JvLg0KPj4NCj4+IFVNTCBkb2Vzbid0IHVzZSB0aGUgYXNzZW1ibHkgQlVHL1dB
Uk4gZmVhdHVyZTsganVzdCB3cmFwcGluZyBnZW5lcmljDQo+PiBCVUcvV0FSTiBmdW5jdGlvbnMg
aW1wbGVtZW50ZWQgaW4gQyB3b3Jrcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBGVUpJVEEgVG9t
b25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQo+IA0KPiBPdmVyYWxsIGxvb2tzIHJl
YXNvbmFibGUuIEEgZmV3IG5pdHMgYmVsb3c6DQoNClRoYW5rcyENCg0KPj4gKyNbbWFjcm9fZXhw
b3J0XQ0KPj4gKyNbZG9jKGhpZGRlbildDQo+PiArI1tjZmcoYWxsKENPTkZJR19CVUcsIG5vdChD
T05GSUdfVU1MKSwgbm90KENPTkZJR19MT09OR0FSQ0gpKSldDQo+PiArI1tjZmcoQ09ORklHX0RF
QlVHX0JVR1ZFUkJPU0UpXQ0KPj4gK21hY3JvX3J1bGVzISB3YXJuX2ZsYWdzIHsNCj4+ICsgICAg
KCRmbGFnczpleHByKSA9PiB7DQo+PiArICAgICAgICBjb25zdCBGTEFHUzogdTMyID0gJGNyYXRl
OjpiaW5kaW5nczo6QlVHRkxBR19XQVJOSU5HIHwgJGZsYWdzOw0KPj4gKyAgICAgICAgY29uc3Qg
X0ZJTEU6ICZbdThdID0gZmlsZSEoKS5hc19ieXRlcygpOw0KPj4gKyAgICAgICAgLy8gUGx1cyBv
bmUgZm9yIG51bGwtdGVybWluYXRvci4NCj4+ICsgICAgICAgIHN0YXRpYyBGSUxFOiBbdTg7IF9G
SUxFLmxlbigpICsgMV0gPSB7DQo+PiArICAgICAgICAgICAgbGV0IG11dCBieXRlcyA9IFswOyBf
RklMRS5sZW4oKSArIDFdOw0KPj4gKyAgICAgICAgICAgIGxldCBtdXQgaSA9IDA7DQo+PiArICAg
ICAgICAgICAgd2hpbGUgaSA8IF9GSUxFLmxlbigpIHsNCj4+ICsgICAgICAgICAgICAgICAgYnl0
ZXNbaV0gPSBfRklMRVtpXTsNCj4+ICsgICAgICAgICAgICAgICAgaSArPSAxOw0KPj4gKyAgICAg
ICAgICAgIH0NCj4+ICsgICAgICAgICAgICBieXRlcw0KPj4gKyAgICAgICAgfTsNCj4+ICsgICAg
ICAgIC8vIFNBRkVUWTogSnVzdCBhbiBGRkkgY2FsbC4NCj4+ICsgICAgICAgIHVuc2FmZSB7DQo+
PiArICAgICAgICAgICAgJGNyYXRlOjphc20hKGNvbmNhdCEoDQo+PiArICAgICAgICAgICAgICAg
ICIvKiB7c2l6ZX0gKi8iLA0KPj4gKyAgICAgICAgICAgICAgICBpbmNsdWRlIShjb25jYXQhKGVu
diEoIk9CSlRSRUUiKSwgIi9ydXN0L2tlcm5lbC9nZW5lcmF0ZWRfYXJjaF93YXJuX2FzbS5ycyIp
KSwNCj4+ICsgICAgICAgICAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJPQkpUUkVFIiks
ICIvcnVzdC9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfcmVhY2hhYmxlX2FzbS5ycyIpKSk7DQo+PiAr
ICAgICAgICAgICAgZmlsZSA9IHN5bSBGSUxFLA0KPj4gKyAgICAgICAgICAgIGxpbmUgPSBjb25z
dCBsaW5lISgpLA0KPj4gKyAgICAgICAgICAgIGZsYWdzID0gY29uc3QgRkxBR1MsDQo+PiArICAg
ICAgICAgICAgc2l6ZSA9IGNvbnN0IDo6Y29yZTo6bWVtOjpzaXplX29mOjo8JGNyYXRlOjpiaW5k
aW5nczo6YnVnX2VudHJ5PigpLA0KPiANCj4gVGhlIGluZGVudGF0aW9uIGhlcmUgaXMgb2RkLiBT
aG91bGRuJ3QgdGhlIGFyZ3VtZW50cyBiZSBpbmRlbnRlZCBvbmUgbW9yZT8NCg0KWWVhaCwgZml4
ZWQuDQoNCg0KPj4gKyNbbWFjcm9fZXhwb3J0XQ0KPj4gKyNbZG9jKGhpZGRlbildDQo+PiArI1tj
ZmcoYWxsKENPTkZJR19CVUcsIG5vdChDT05GSUdfVU1MKSwgbm90KENPTkZJR19MT09OR0FSQ0gp
KSldDQo+PiArI1tjZmcobm90KENPTkZJR19ERUJVR19CVUdWRVJCT1NFKSldDQo+PiArbWFjcm9f
cnVsZXMhIHdhcm5fZmxhZ3Mgew0KPj4gKyAgICAoJGZsYWdzOmV4cHIpID0+IHsNCj4+ICsgICAg
ICAgIGNvbnN0IEZMQUdTOiB1MzIgPSAkY3JhdGU6OmJpbmRpbmdzOjpCVUdGTEFHX1dBUk5JTkcg
fCAkZmxhZ3M7DQo+PiArICAgICAgICAvLyBTQUZFVFk6IEp1c3QgYW4gRkZJIGNhbGwuDQo+PiAr
ICAgICAgICB1bnNhZmUgew0KPj4gKyAgICAgICAgICAgICRjcmF0ZTo6YXNtISgNCj4+ICsgICAg
ICAgICAgICBjb25jYXQhKA0KPj4gKyAgICAgICAgICAgICAgICAiLyoge3NpemV9ICovIiwNCj4+
ICsgICAgICAgICAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJPQkpUUkVFIiksICIvcnVz
dC9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfd2Fybl9hc20ucnMiKSksDQo+PiArICAgICAgICAgICAg
ICAgIGluY2x1ZGUhKGNvbmNhdCEoZW52ISgiT0JKVFJFRSIpLCAiL3J1c3Qva2VybmVsL2dlbmVy
YXRlZF9hcmNoX3JlYWNoYWJsZV9hc20ucnMiKSkpOw0KPj4gKyAgICAgICAgICAgIGZsYWdzID0g
Y29uc3QgRkxBR1MsDQo+PiArICAgICAgICAgICAgc2l6ZSA9IGNvbnN0IDo6Y29yZTo6bWVtOjpz
aXplX29mOjo8JGNyYXRlOjpiaW5kaW5nczo6YnVnX2VudHJ5PigpLA0KPiANCj4gU2FtZSB0aGlu
ZyBoZXJlLg0KDQpGaXhlZC4NCg0KPj4gKyAgICAgICAgICAgICk7DQo+PiArICAgICAgICB9DQo+
PiArICAgIH0NCj4+ICt9DQo+PiArDQo+PiArI1ttYWNyb19leHBvcnRdDQo+PiArI1tkb2MoaGlk
ZGVuKV0NCj4+ICsjW2NmZyhhbGwoQ09ORklHX0JVRywgQ09ORklHX1VNTCkpXQ0KPj4gK21hY3Jv
X3J1bGVzISB3YXJuX2ZsYWdzIHsNCj4+ICsgICAgKCRmbGFnczpleHByKSA9PiB7DQo+PiArICAg
ICAgICAvLyBTQUZFVFk6IEp1c3QgYW4gRkZJIGNhbGwuDQo+PiArICAgICAgICB1bnNhZmUgew0K
Pj4gKyAgICAgICAgICAgICRjcmF0ZTo6YmluZGluZ3M6Ondhcm5fc2xvd3BhdGhfZm10KA0KPj4g
KyAgICAgICAgICAgICAgICAkY3JhdGU6OmNfc3RyISg6OmNvcmU6OmZpbGUhKCkpLmFzX3B0cigp
IGFzICpjb25zdCA6OmNvcmU6OmZmaTo6Y191Y2hhciwNCj4+ICsgICAgICAgICAgICAgICAgbGlu
ZSEoKSBhcyBpMzIsDQo+PiArICAgICAgICAgICAgICAgICRmbGFncyBhcyB1MzIsDQo+PiArICAg
ICAgICAgICAgICAgIDo6Y29yZTo6cHRyOjpudWxsKCkgYXMgKmNvbnN0IDo6Y29yZTo6ZmZpOjpj
X3VjaGFyLA0KPiANCj4gV2h5IHVuc2lnbmVkIGNoYXI/IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUg
OjprZXJuZWw6OmZmaTo6Y19jaGFyIHRvDQo+IHV0aWxpemUgdGhlIGN1c3RvbSBpbnRlZ2VyIHR5
cGUgZGVmaW5pdGlvbnMgaW4ga2VybmVsIHJhdGhlciB0aGFuIHRoZQ0KPiBmYXVsdHkgb25lcyBp
biBjb3JlLg0KPiANCj4gKE1heWJlICRjcmF0ZSByYXRoZXIgdGhhbiBrZXJuZWwpDQoNCk9vcHMs
IHJlcGxhY2VkIHRoZW0gd2l0aCAkY3JhdGU6OmZmaTo6Y19jaGFyDQoNCg==

