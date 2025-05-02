Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DE0C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtQh+/YSXXqkRAun9KktFMfLGSEdqy4gdJOL8UsStjU=; b=kmHfTx8p05azXjOA9HMY1dzBAe
	a5BqPtDvYTff5GjT6jb3aPmrrbN7aiEsnwi4tI3Hr+FzmRtlOLdC9BLnbmkYcXHMY2s5coou8UI3E
	dVjDqcShPu2c16UZVbVpdcg4jm4yuyIRPKLr+NGB2fr4htNHcF40FJNnKFIAvcIFQiNIgvtZor4Oi
	Tzd5H8vipo0TSJUgYlYbTM1iZiWQigzVNJCoEN1Ulz1Y7epIz00UFHfyCtFcyvsXG1ISVGLiSr0kX
	wsQLiJw1NVxLBtmfT9cYMRitgfWZGME7yQNnBlBAKofRK38K9EQNHwnDnNR+kFqSvKLJrfG1bJpDc
	sSpc0Qlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuD8-00000002gfi-2ZMn;
	Fri, 02 May 2025 17:30:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu8n-00000002gHd-0onH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 17:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
	Subject:Sender:Reply-To:Content-Description;
	bh=UtQh+/YSXXqkRAun9KktFMfLGSEdqy4gdJOL8UsStjU=; b=Ax5eexazxFcZ7XedEzkj73NWSW
	YDIAiNC271/wiHXK98Q+foACx7kBGB8NieXwaS8P3rujOZl2ZZe8U/3rUSHy7V4/r3asAiHwjTiwQ
	zPPSu6oARheJB+ect7tTICIeLq0TBGjrTXqRy12xI+l0fTt52wnf9X38mEVwjoGDwGGx3BFqnx5i3
	YX3AFC0IR5mI0skIeFb30IYLHvXj5zRaJMaZj4LlUOeF+JeMrbQ/Xx/IT1uT9UvJ22sUf3aNPOl6Q
	2Ck8zaufd+GB1AfaEw6hLxssZJh4ThDp9RcTHWsV+jF8+xTrfhXYJvi0ZHfx0k50cRHopXtCgoo2U
	EyZBIaPg==;
Received: from smtp-fw-80008.amazon.com ([99.78.197.219])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAu8f-0000000F4tx-2wgi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1746206729; x=1777742729;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=UtQh+/YSXXqkRAun9KktFMfLGSEdqy4gdJOL8UsStjU=;
  b=nRiSjnYSEbBFiLJWe59y1Cnq2l9JtQisWx+TjRwoPk981D0KEnAlzwod
   wZCrbLsgp/RxoN44ydMD9l4ld+PHBQe/PYBGnSBtkbA0DA+/oTxHvCH6V
   D3Bhy/Uav7xwt8CrtmrKsi940z3XcPzGsC8dfGNPf1HBrw6TTsIqJ1X/O
   0=;
X-IronPort-AV: E=Sophos;i="6.15,257,1739836800"; 
   d="scan'208";a="192951124"
Subject: Re: EEVDF regression still exists
Thread-Topic: EEVDF regression still exists
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 17:25:16 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.38.20:26814]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.11.224:2525] with esmtp (Farcaster)
 id 68d9cd7a-6a75-4597-83ee-277d0e2c4386; Fri, 2 May 2025 17:25:15 +0000 (UTC)
X-Farcaster-Flow-ID: 68d9cd7a-6a75-4597-83ee-277d0e2c4386
Received: from EX19D001UWB004.ant.amazon.com (10.13.138.4) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 2 May 2025 17:25:15 +0000
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19D001UWB004.ant.amazon.com (10.13.138.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 2 May 2025 17:25:15 +0000
Received: from EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0]) by
 EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0%5]) with mapi id
 15.02.1544.014; Fri, 2 May 2025 17:25:15 +0000
From: "Prundeanu, Cristian" <cpru@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, "Mohamed Abuelfotoh, Hazem"
	<abuehaze@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, "Blake, Geoff"
	<blakgeof@amazon.com>, "Csoma, Csaba" <csabac@amazon.com>, "Doebel, Bjoern"
	<doebel@amazon.de>, Gautham Shenoy <gautham.shenoy@amd.com>, Swapnil Sapkal
	<swapnil.sapkal@amd.com>, Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, Borislav Petkov
	<bp@alien8.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tip-commits@vger.kernel.org"
	<linux-tip-commits@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Thread-Index: AQHbuU8Zth8BPweWAUWz5H5EpP8DD7O7+3yAgANMZ4A=
Date: Fri, 2 May 2025 17:25:14 +0000
Message-ID: <B27ECDA1-632D-44CD-AB99-B7A9C27393E4@amazon.com>
References: <20250429213817.65651-1-cpru@amazon.com>
 <20250430100259.GK4439@noisy.programming.kicks-ass.net>
In-Reply-To: <20250430100259.GK4439@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.138.196]
Content-Type: text/plain; charset="utf-8"
Content-ID: <65213DACC676A045A3614A07465F5362@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_182530_781190_3CAFEE16 
X-CRM114-Status: GOOD (  14.74  )
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

T24gMjAyNS0wNC0zMCwgMDU6MDMsICJQZXRlciBaaWpsc3RyYSIgPHBldGVyekBpbmZyYWRlYWQu
b3JnIDxtYWlsdG86cGV0ZXJ6QGluZnJhZGVhZC5vcmc+PiB3cm90ZToNCg0KPiBBbnl3YXksIGxv
b2tpbmcgYXQgdGhlIHR3byBpbmRpdmlkdWFsIHJlcG9ydHMgc2lkZSBieSBzaWRlOg0KPg0KPiAt
IHNjaGVkdWxlKCkgbGVmdCB0aGUgcHJvY2Vzc29yIGlkbGUgLS0gaXMgdXANCj4NCj4gdnMuDQo+
DQo+IC0gcHVsbF90YXNrKCkgY291bnQgb24gY3B1IG5ld2x5IGlkbGUgLS0gaXMgZG93bg0KPiAt
IGxvYWRfYmFsYW5jZSgpIHN1Y2Nlc3MgY291bnQgb24gY3B1IG5ld2x5IGlkbGUgLS0gaXMgZG93
bg0KPg0KPiBXaGljaCBzZWVtIHJlbGF0ZWQgYW5kIHdvdWxkIHN1Z2dlc3Qgd2UgbG9vayBhdCBu
ZXdpZGxlIGJhbGFuY2UuIE9uZSBvZg0KPiB0aGUgdGhpbmdzIHdlJ3ZlIHNlZW4gYmVmb3JlIGlz
IHRoYXQgbmV3aWRsZSB3YXMgYWZmZWN0ZWQgYnkgdGhlIHNob3J0ZXINCj4gc2xpY2Ugb2YgRUVW
REYuIEJ1dCBpdCBpcyBhbHNvIHF1aXRlIHBvc3NpYmxlIHNvbWV0aGluZyBjaGFuZ2VkIGluIHRo
ZQ0KPiBsb2FkLWJhbGFuY2VyIGhlcmUuDQo+DQo+IEFsc28gb2Ygbm90ZSBpcyB0aGF0IC4xNSBz
ZWVtcyB0byBoYXZlIGEgbG93ZXIgbnVtYmVyIG9mICd0dHd1KCkgd2FzDQo+IGNhbGxlZCB0byB3
YWtlIHVwIG9uIHRoZSBsb2NhbCBjcHUnIC0tIHdoaWNoIEknbSBub3QgcXVpdGUgc3VyZSBob3cg
dG8NCj4gcmh5bWUgd2l0aCB0aGUgcHJldmlvdXMgb2JzZXJ2YXRpb24uIFRoZSBuZXdpZGxlIHRo
aW5nIHNlZW1zIHRvIHN1Z2dlc3QNCj4gbm90IGVub3VnaCBtaWdyYXRpb25zLCB3aGlsZSB0aGlz
IHdvdWxkIHN1Z2dlc3QgdG9vIG1hbnkgbWlncmF0aW9ucy4NCg0KQSAyeCBsb25nZXIgc2xpY2Ug
b24gNi4xNSBkb2VzIGltcHJvdmUgcGVyZm9ybWFuY2Ugc29tZSwgYnV0IG5vdCBieSBhIGxvdC4N
Ckkgd2VudCBiYWNrIHRvIGxvb2sgYXQgbXkgcHJldmlvdXMgdGVzdHMsIGFuZCBiYWNrIGluIFNl
cHRlbWJlciBJIGRpZCB0cnkNCm11bHRpcGxlIHNsaWNlIHZhbHVlcyAoMS41bXMsIDNtcywgNm1z
LCAxMm1zKSBvbiA2LjUgYW5kIDYuNi4gVGhlIHJlc3BvbnNlDQp3YXMgbm9pc3kgKG11Y2ggbGVz
cyBvbiBDRlMgaG93ZXZlciksIGFuZCBub3QgbGluZWFyLCBwZWFraW5nIGF0IDNtcy4NCkRvZXMg
dGhlIGxhY2sgb2YgbGluZWFyaXR5IG1hdGNoIHlvdXIgZXhwZWN0YXRpb25zPyBXb3VsZCBpdCBo
YXZlIHJlYXNvbg0KdG8gY2hhbmdlIGluIG1vcmUgcmVjZW50IGtlcm5lbHM/DQoNCkFub3RoZXIs
IG1vcmUgcmVjZW50IG9ic2VydmF0aW9uIGlzIHRoYXQgNi4xNS1yYzQgaGFzIHdvcnNlIHBlcmZv
cm1hbmNlIHRoYW4NCnJjMyBhbmQgZWFybGllciBrZXJuZWxzLiBNYXliZSB0aGF0IGNhbiBoZWxw
IG5hcnJvdyBkb3duIHRoZSBjYXVzZT8NCkkndmUgYWRkZWQgdGhlIHBlcmYgcmVwb3J0cyBmb3Ig
cmMzIGFuZCByYzIgaW4gdGhlIHNhbWUgbG9jYXRpb24gYXMgYmVmb3JlLg0KDQpodHRwczovL2dp
dGh1Yi5jb20vYXdzL3JlcHJvLWNvbGxlY3Rpb24vYmxvYi9tYWluL3JlcHJvcy9yZXByby1teXNx
bC1FRVZERi1yZWdyZXNzaW9uL3Jlc3VsdHMvMjAyNTA0MjgvUkVBRE1FLm1kI3Jhdy1kYXRhDQoN
Cg0K

