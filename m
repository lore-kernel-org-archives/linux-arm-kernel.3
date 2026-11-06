Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2B606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xJPnTXoM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=r3ZVLrf1;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=FBokbQc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X+wAJ5SyEGYkroaGqjzIjkC1zGT1qeLhu2+ChrpAQmA=; b=xJPnTXoMa7skLO+06JOZ9lwLth
	lr+vOCzEUDWpPZf0nAHz1Es6482bePPJrTEZgKKrIXqHOQbhVugsUf8dMWCtOlxbMKu8Lv21MB0xd
	ITHRNwrey7kKUowUcHU3GuUkcaQOdaJXKKNY7VEMNvNarsyS+Ln1Oma/mt28B4yQSbPbxAqBhkG4B
	kDfmnaWz27YAeyOvIpqQ5GwE4xqZXMrlI/RdsVoR+6oXKiUtrpLumTXDa8O3S1jDa7oflNF3hTBNC
	mHXp8HAIqBJYZmtYJBc++Wpq3hBxXrt7Up4FNNfoi1u/zUNF8BTZdYPJR+z/hagQeshkHbvssbE5J
	Z7KFXi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD2F-0000000BJFa-3e5V;
	Fri, 06 Nov 2026 06:02:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD2E-0000000BJFD-2X67;
	Fri, 06 Nov 2026 06:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=X+wAJ5SyEGYkroaGqjzIjkC1zGT1qeLhu2+ChrpAQmA=; b=r3ZVLrf1KFnGJZWy+ZDVyTidWR
	tWEdQgmUkcywfeoONkqBZyBEX/ogxEeQjwrW6rjoyPHCS7BFWpTmx/4/h+H1B9xgCCW6NofriDo7e
	umkEmTj1CrSXI7+htcxj26A/IzRi/4IrOCDmFvcUH64+DKiodPZ+KI0XdWWWMXm4nLPh8uSYIV7vC
	0hGYTNVghAD3fRJXbF0YT+XNxyRUuwgJaQpQR7TMNL/JmhlWJxh+3K+WDSfRb1CrcDGlqrb9sNXuf
	HmzcDLyzzQcfCCYQ083Mb0zMwfPn1ffNGGhA8WwUT6mh9rtCOGnhbA7eJNZBNT2HHYnQYtKdI5WhD
	GjxmZNoQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD2B-00000000OIm-09a4;
	Fri, 06 Nov 2026 06:02:45 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A662CtT41385528, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793944932; bh=X+wAJ5SyEGYkroaGqjzIjkC1zGT1qeLhu2+ChrpAQmA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=FBokbQc25PMVjZFqNzTHgYWbtxrfjSTniYbS9U+49Cd3vr9lc9RxG8D5KaAarM9A5
	 WVwuxhqENhvOU8sUPhvYhEscAq6XXTWrC8Tdht6H//helVYSYlTmHbzUgnsYddmvz6
	 nfGPlTFPhZpG66hgM0h7rM6krrrqbaNDh2jGLcT9DSrDsGPe6XUw9UYaHOxZHjPU3K
	 hkh8AFT9+dfKk592YmjwPAaP8SX1EUBu6B/zhKPMKSuxhFtyog29thqyxx1OzcKFlC
	 lhgkGEmv8d4KS2BK0HibO0qSCXMz8eP3Gj/TYjbCqKpdGAVwYW1nNlBCbwiAY2rFZQ
	 wwJ2HybbqqJjQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A662CtT41385528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Nov 2026 14:02:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 14:01:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 14:01:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 6 Nov 2026 14:01:01 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: realtek: Add RTD syscon compatibles
Thread-Topic: [PATCH] arm64: dts: realtek: Add RTD syscon compatibles
Thread-Index: AQHda+TWqVDVhi8CqkeHHFl4uLhKrLcgh/Yg
Date: Fri, 6 Nov 2026 06:01:01 +0000
Message-ID: <2c1c335b10fd400f9817155ace73cae6@realtek.com>
References: <20261103224352.862662-1-robh@kernel.org>
In-Reply-To: <20261103224352.862662-1-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_060243_386808_2C411855 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAic3lzY29uIiBub2RlcyBtdXN0IGhhdmUgc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmdzLiBT
cGVjaWZpYyBjb21wYXRpYmxlcw0KPiB3ZXJlIGFscmVhZHkgYWRkZWQgdG8gdGhlIGJpbmRpbmdz
LiBVcGRhdGUgdGhlIERUUyBmaWxlcyB3aXRoIHRoZSBzcGVjaWZpYw0KPiBjb21wYXRpYmxlcyBm
b3IgdGhlIFJURDEyOTUsIFJURDEzOTUgYW5kIFJURDE2MTkgQ1JULCBJU08sIFNCMiwgbWlzYyBh
bmQNCj4gU0NQVSB3cmFwcGVyIHN5c2NvbiBibG9ja3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBS
b2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KDQpBcHBsaWVkLCB0aGFua3MhDQoN
CkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==

