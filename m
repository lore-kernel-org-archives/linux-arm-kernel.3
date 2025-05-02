Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4B2C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/dFk48f7VSDO8MaFHLbXTmrEKYB/ZJL5VKCMV+8zzo=; b=tHgcob4t1ZYMcD9+9u6jkwVsti
	UPDTE+wcKkN1T+9who+lHcBOndSSSX+ts4Aey3po2uObCW2AJOQz5GdNQSedXNJp6XOQyB74KrTOJ
	SgcaTXNfkh4WBfxnpQ93QHgy8aP08K+vIqu5ZgnLom+xcmracaGmA+eBd+DNLOsRjq2KOJ5FPxmUp
	+wc3pOap84KKucy/u19PEY/gpakM/w52+3nTWdGxcugW6WraQFN+PBhrST5vB9U5ENOL2TJ/jW94M
	Sal3FnDgjuKkVJ00ZW5yNjd0n5EHc8gSmxxliw7WED+Ew4GCbKLfjpk68Cyx0Eug2XuubGOdPYbGl
	S61Op1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAup2-00000002kOp-0NHX;
	Fri, 02 May 2025 18:09:16 +0000
Received: from smtp-fw-9106.amazon.com ([207.171.188.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAulz-00000002k3r-2Qp7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 18:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1746209167; x=1777745167;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=x/dFk48f7VSDO8MaFHLbXTmrEKYB/ZJL5VKCMV+8zzo=;
  b=eZoJnBhc21LCfGxiN44vMqCe5K6yH3dtlp1bUgSK2Bx26Rckyo9ihKUT
   Vfwjo1jby55LC8xfsTbjI+QTXlGn/zJxI4jWibMXhandj88pVw+WDh46c
   RfPsG5jRkeyBAc/msPkgZ9E2uBl8ZGBMhkOJui6cz/U2NenrSkAdC4CQ6
   Q=;
X-IronPort-AV: E=Sophos;i="6.15,257,1739836800"; 
   d="scan'208";a="821188942"
Subject: Re: EEVDF regression still exists
Thread-Topic: EEVDF regression still exists
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 18:06:06 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:55999]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.21.68:2525] with esmtp (Farcaster)
 id eac2cf77-2b8f-461f-9975-96b0cd0fa940; Fri, 2 May 2025 18:06:05 +0000 (UTC)
X-Farcaster-Flow-ID: eac2cf77-2b8f-461f-9975-96b0cd0fa940
Received: from EX19D002UWA001.ant.amazon.com (10.13.138.247) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 2 May 2025 18:06:05 +0000
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19D002UWA001.ant.amazon.com (10.13.138.247) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 2 May 2025 18:06:05 +0000
Received: from EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0]) by
 EX19D016UWA004.ant.amazon.com ([fe80::92ec:e30c:889c:c2c0%5]) with mapi id
 15.02.1544.014; Fri, 2 May 2025 18:06:05 +0000
From: "Prundeanu, Cristian" <cpru@amazon.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>, "Saidi, Ali"
	<alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"Blake, Geoff" <blakgeof@amazon.com>, "Csoma, Csaba" <csabac@amazon.com>,
	"Doebel, Bjoern" <doebel@amazon.de>, Gautham Shenoy <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>, Joseph Salisbury
	<joseph.salisbury@oracle.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tip-commits@vger.kernel.org"
	<linux-tip-commits@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Thread-Index: AQHbuU8Zth8BPweWAUWz5H5EpP8DD7O7MGMA//+vIgCAAK8gAIACE5kAgAE45gCAAAphgIAAbcaA
Date: Fri, 2 May 2025 18:06:05 +0000
Message-ID: <E120CFCF-8BFF-44BB-96B7-C70E020E2A31@amazon.com>
References: <20250429213817.65651-1-cpru@amazon.com>
 <20250429215604.GE4439@noisy.programming.kicks-ass.net>
 <82DC7187-7CED-4285-85FC-7181688CD873@amazon.com>
 <f241b773-fca8-4be2-8a84-5d3a6903d837@amd.com>
 <CFA24C6D-8BC4-490D-A166-03BDF3C3E16C@amazon.com>
 <d875adc0-744e-4b1f-a1bf-7e051298a0ae@amd.com>
 <7d3bd258-fa45-4e85-8700-90203bacdeea@amd.com>
In-Reply-To: <7d3bd258-fa45-4e85-8700-90203bacdeea@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.138.181]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8682AA6145737418B1459D6E080A3BD@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_110607_651286_B3A3AB31 
X-CRM114-Status: GOOD (  18.67  )
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

SGkgUHJhdGVlaywNCg0K77u/T24gMjAyNS0wNS0wMiwgMDE6MzMsICJLIFByYXRlZWsgTmF5YWsi
IDxrcHJhdGVlay5uYXlha0BhbWQuY29tIDxtYWlsdG86a3ByYXRlZWsubmF5YWtAYW1kLmNvbT4+
IHdyb3RlOg0KDQo+PiBDb3VsZCB5b3UgYWxzbyBwcm92aWRlIHNvbWUgaW5mb3JtYXRpb24gb24g
eW91ciBMREcgbWFjaGluZSAtIGl0cw0KPj4gY29uZmlndXJhdGlvbiBhbmQgaGUga2VybmVsIGl0
IGlzIHJ1bm5pbmcgKGFsdGhvdWdoIHRoaXMgc2hvdWxkbid0DQo+PiByZWFsbHkgbWF0dGVyIGFz
IGxvbmcgYXMgaXQgaXMgc2FtZSBhY3Jvc3MgcnVucykNCj4NCj4gU28gSSdtIGxvb2tpbmcgYXQg
bG9ncyBhdCBMREcgc2lkZSB3aGljaCBpcyBhIDR0aCBHZW5lcmF0aW9uIEVQWUMgc3lzdGVtDQo+
IHdpdGggMTkyQ1BVcyBydW5uaW5nIHRoZSByZXBybyBvbiBiYXJlbWV0YWwgYW5kIEkgc2VlOg0K
Pg0KPiBbMjAyNTA1MDIuMDYxNjI3XSBbSU5GT10gU1RBUlRJTkcgVEVTVA0KPiBbMjAyNTA1MDIu
MDYxNjI3XSBbSU5GT10gNzY4IFZVDQo+DQo+IDc2OFZVIGVhY2ggcHJvY2Vzc2luZyAxMDAwMDAw
MDAwMDAwIHRyYW5zYWN0aW9ucyBzZW50IHRvIGEgMTZ2Q1BVDQo+IFNVVCBpbnN0YW5jZSBzZWVt
cyBsaWtlIGEgaGlnaGx5IG92ZXJsb2FkZWQgKGFuZCB1bnJlYWxpc3RpYykgc2NlbmFyaW8NCj4g
YnV0IHBlcmhhcHMgeW91ciBMREcgaXMgYWxzbyBhIHNpbWlsYXIgMTZ2Q1BVIGluc3RhbmNlIHdo
aWNoIGNhcHMgdGhlDQo+IFZVIGF0IDY0Pw0KDQpZb3UncmUgcmlnaHQsIG15IExERyBpcyBzbWFs
bGVyLiBJJ20gdXNpbmcgYSA2NCB2Q1BVIDEyOEdCIFJBTSBHcmF2aXRvbjMNCmluc3RhbmNlICh0
aGlzIGlzIG1lbnRpb25lZCBpbiB0aGUgdGVzdCByZXN1bHRzIFJFQURNRSBbMV0pLCByZXN1bHRp
bmcNCmluIDI1NiBWVXMuDQoNClRoZSBWVSBjb3VudCBzaG91bGQgcmVhbGx5IGJlIGJhc2VkIG9u
IHRoZSBTVVQgY29yZSBjb3VudCwgYW5kIGJlIGF0IGxlYXN0DQo4ICogU1VUIHZDUFVzIHRvIGVu
c3VyZSBhIGZ1bGwgbG9hZC4gQ3VycmVudGx5IHRoZSByZXByb2R1Y2VyIGRvZXMgbm90DQpzdXBw
b3J0IHF1ZXJ5aW5nIHRoZSBTVVQgdkNQVXMgZnJvbSB0aGUgTERHIHNpZGUsIHdoaWNoIGlzIHdo
eSBpdCBkZWZhdWx0cw0KdG8gdXNpbmcgdGhlIExERyBjb3JlIGNvdW50IGluc3RlYWQgLSBidXQg
dGhlIGFzc3VtcHRpb24gb2YgdGhvc2UgY291bnRzDQpiZWluZyBjb3JyZWxhdGVkIG5lZWRzIHJl
dmlzaXRpbmcuDQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vYXdzL3JlcHJvLWNvbGxlY3Rpb24v
YmxvYi9tYWluL3JlcHJvcy9yZXByby1teXNxbC1FRVZERi1yZWdyZXNzaW9uL3Jlc3VsdHMvMjAy
NTA0MjgvUkVBRE1FLm1kDQoNCj4gQ3VycmVudGx5IGRvaW5nIGEgdHJpYWwgcnVuLCBzdGFyaW5n
IGF0IGxvZ3MgdG8gc2VlIHdoYXQgSSBuZWVkIHRvDQo+IGFkanVzdCBiYXNlZCBvbiB0aGUgZXJy
b3JzLiBJJ2xsIGFkanVzdCB0aGUgTERHIGJhc2VkIG9uIHlvdXIgY29tbWVudHMNCj4gYW5kIHRy
eSB0byByZXByb2R1Y2UgdGhlIHNjZW5hcmlvIG92ZXIgdGhlIHdlZWtlbmQuDQoNCllvdXIgaGVs
cCBpcyBtdWNoIGFwcHJlY2lhdGVkIQ0KDQpBIGNvdXBsZSBtb3JlIHRob3VnaHRzIG9uIHRoZSBz
ZXR1cDoNClRoZSBMREcgc2hvdWxkIG1haW5seSBiZSBhYmxlIHRvIGNvdmVyIGVub3VnaCBsb2Fk
IHRvIG5vdCBiZSBhIGJvdHRsZW5lY2suDQpTYW1lIGdvZXMgZm9yIHRoZSBuZXR3b3JrIGNvbm5l
Y3Rpb24uIEF0IHRoZSBzYW1lIHRpbWUsIHRoZSBTVVQgbmVlZHMgdG8NCmhhdmUgYSBmYXN0IGVu
b3VnaCBkaXNrIHNvIGl0IGRvZXNuJ3QgYmVjb21lIHRoZSBsaW1pdGluZyBmYWN0b3IgKEkndmUg
c2Vlbg0KdGhpcyBpc3N1ZSBpbiB0aGUgcGFzdDsgdGhlIHJlc3VsdHMgd2lsbCBzaG93IGEgbWlu
aW1hbCBkaWZmZXJlbmNlIG9ubHkpLg0KDQoNCg==

