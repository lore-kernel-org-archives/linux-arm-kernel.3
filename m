Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76533C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:Date:To:From:Cc:MIME-Version:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DKmIUXYLZzbE+8OaIPUbf78eHaq8YuAnDEkzvgFROAk=; b=4otHMqjKMdmuoQhCPv8CoC7jTK
	x0vHXSrcF00+p9UuKLYBE3L2S5RbIPjpXKe5epniNEDaokeLg8fxXQ9vHq9ACObi/ZHW7AAQPBKeC
	kwQeEt7Qs8amC7Rsrn5ODwftmfYOwz2kgWDaZ9WhZkJbG32G56zOYJOU3btNIDd4N2CHsgudtss5o
	LmC+P6AikHYuSz1n99NSbz4AKJg7aE24vHo+GnLo0LwZt1Bvs9I/MtojoUfIDC/xwPb9j0bMmjT29
	qFdN19AAzZlBqlcxPkKNQXi++rSGHc3SOQ130aPs/a39fTE/wkWcYNRuSLwilhO9QT3ZurAJcLjFj
	gyry4WDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRad-00000004fTO-0y6B;
	Tue, 04 Mar 2025 12:41:39 +0000
Received: from competitiveness.precisionfactorysolutions.com ([107.175.115.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRZ3-00000004fLp-0qLe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 12:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=selector2;
 d=competitiveness.precisionfactorysolutions.com;
 h=From:Sender:Reply-To:To:Date:Subject:Content-Type:Content-Transfer-Encoding;
 i=Chum-Nam.Aubry@competitiveness.precisionfactorysolutions.com;
 bh=DKmIUXYLZzbE+8OaIPUbf78eHaq8YuAnDEkzvgFROAk=;
 b=lsRfTxduyiNhB98AOl5boxu3gBS3dSdxM2rXPFx/y2hMxh2IUbRrjlSKvMC28sq8a/XAgvXNPCeU
   JwTHjISxs76LAXa6oF2Qn0Z4aKEbo6KMRYRUtZLQOysa6+hx3umLIpMIkJ1t6wBjV88q32ZJW3id
   kdWIkNSSecx5qN2cOBo=
From: Chum-Nam.Aubry <Chum-Nam.Aubry@competitiveness.precisionfactorysolutions.com>
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Date: Tue, 4 Mar 2025 20:19:55 +0800
Subject: Combine efforts with us for unparalleled quality, service, and forward-thinking innovation.
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_044001_319626_1D8D3777 
X-CRM114-Status: UNSURE (  -0.80  )
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
Reply-To: bill@craftcoremoulds.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Message-ID: <E1tpRad-00000004fTO-0y6B@bombadil.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

R29vZCBldmVuaW5nIGxpbnV4LWFybS1rZXJuZWwsDQpDTk0gU2hlbnpoZW4sIHdoaWNoIHdhcyBm
b3VuZGVkIGluIDIwMDYsIGVuam95cyBhIHN0cmF0ZWdpYyBnZW9ncmFwaGljYWwgbG9jYXRpb24g
YW5kIGVhc3kgdHJhbnNwb3J0YXRpb24gYWNjZXNzLiBXZSBleGNlbCBpbiBkZXNpZ25pbmcgYW5k
IG1hbnVmYWN0dXJpbmcgcHJlY2lzaW9uIG1lY2hhbmljYWwgcGFydHMsIG1vbGQgY29tcG9uZW50
cywgcHJlY2lzaW9uIGNvbXBvbmVudHMsIGppZ3MsIGZpeHR1cmVzLCBhbmQgaGFyZHdhcmUgcGFy
dHMuDQoNCkluIGFkZGl0aW9uIHRvIG91ciBtb2xkIG1hbnVmYWN0dXJpbmcgc2VydmljZXMsIHdl
IGFsc28gb2ZmZXIgYSB3aWRlIHJhbmdlIG9mIGNvbXBsZW1lbnRhcnkgc2VydmljZXMgdG8gY2F0
ZXIgdG8gYWxsIHlvdXIgbWFudWZhY3R1cmluZyBuZWVkcy4gT3VyIHNlcnZpY2VzIGluY2x1ZGU6
DQogMS4zRCBQcmludGluZzogV2UgdXRpbGl6ZSBhZHZhbmNlZCAzRCBwcmludGluZyB0ZWNobm9s
b2dpZXMgdG8gcXVpY2tseSBhbmQgYWNjdXJhdGVseSBwcm9kdWNlIHByb3RvdHlwZXMgYW5kIGZ1
bmN0aW9uYWwgcGFydHMsIGFsbG93aW5nIGZvciByYXBpZCBwcm9kdWN0IGRldmVsb3BtZW50IGFu
ZCB0ZXN0aW5nLg0KIDIuQ05DIE1hY2hpbmluZzogT3VyIHN0YXRlLW9mLXRoZS1hcnQgQ05DIG1h
Y2hpbmVzIGVuYWJsZSBwcmVjaXNlIGFuZCBlZmZpY2llbnQgbWFjaGluaW5nIG9mIHZhcmlvdXMg
bWF0ZXJpYWxzLCBlbnN1cmluZyBoaWdoLXF1YWxpdHkgY29tcG9uZW50cyBhbmQgbW9sZHMuDQog
My5TdXJmYWNlIFRyZWF0bWVudDogV2Ugb2ZmZXIgYSBjb21wcmVoZW5zaXZlIHJhbmdlIG9mIHN1
cmZhY2UgdHJlYXRtZW50IG9wdGlvbnMsIGluY2x1ZGluZyBwYWludGluZywgY29hdGluZywgYW5v
ZGl6aW5nLCBhbmQgbW9yZSwgdG8gZW5oYW5jZSB0aGUgYXBwZWFyYW5jZSBhbmQgZHVyYWJpbGl0
eSBvZiB5b3VyIHByb2R1Y3RzLg0KIDQuRmlsbSBDb2F0aW5nOiBPdXIgZmlsbSBjb2F0aW5nIHNl
cnZpY2VzIHByb3ZpZGUgYW4gYWRkaXRpb25hbCBsYXllciBvZiBwcm90ZWN0aW9uIHRvIHlvdXIg
bW9sZHMsIGltcHJvdmluZyB0aGVpciBwZXJmb3JtYW5jZSBhbmQgZXh0ZW5kaW5nIHRoZWlyIGxp
ZmVzcGFuLg0KIDUuUHJvdG90eXBpbmc6IFdlIG9mZmVyIHJhcGlkIHByb3RvdHlwaW5nIHNlcnZp
Y2VzIHRvIGhlbHAgeW91IHZpc3VhbGl6ZSBhbmQgdGVzdCB5b3VyIGRlc2lnbnMgYmVmb3JlIG1v
dmluZyBmb3J3YXJkIHdpdGggbWFzcyBwcm9kdWN0aW9uLCBzYXZpbmcgdGltZSBhbmQgcmVkdWNp
bmcgY29zdHMuDQogNi5Qcm9kdWN0IERlc2lnbiBhbmQgRGV2ZWxvcG1lbnQ6IE91ciBleHBlcmll
bmNlZCBkZXNpZ24gYW5kIGRldmVsb3BtZW50IHRlYW0gY2FuIGFzc2lzdCB5b3UgaW4gYnJpbmdp
bmcgeW91ciBpZGVhcyB0byBsaWZlLCBlbnN1cmluZyB0aGF0IHlvdXIgcHJvZHVjdHMgbWVldCB5
b3VyIHNwZWNpZmljYXRpb25zIGFuZCBtYXJrZXQgZGVtYW5kcy4NCiA3LkFzc2VtYmx5IFNlcnZp
Y2VzOiBXZSBwcm92aWRlIGNvbnZlbmllbnQgYW5kIGVmZmljaWVudCBhc3NlbWJseSBzZXJ2aWNl
cywgb2ZmZXJpbmcgZnVsbHkgYXNzZW1ibGVkIHByb2R1Y3RzIHJlYWR5IGZvciBkaXN0cmlidXRp
b24uDQoNCldpdGggYWNjZXNzIHRvIGN1dHRpbmctZWRnZSBtYW51ZmFjdHVyaW5nIGVxdWlwbWVu
dCBhbmQgcHJvY2Vzc2luZyB0ZWNobm9sb2dpZXMgZnJvbSBTd2l0emVybGFuZCwgSmFwYW4sIGFu
ZCBvdGhlciB0b3AtdGllciBuYXRpb25zLCBDTk0gY2F0ZXJzIHByZWRvbWluYW50bHkgdG8gRXVy
b3BlYW4gYW5kIEFtZXJpY2FuIG1hcmtldHMsIGluY2x1ZGluZyB0aGUgVVNBLCBHZXJtYW55LCBV
SywgRnJhbmNlLCBhcyB3ZWxsIGFzIEFzaWFuIHJlZ2lvbnMgbGlrZSBKYXBhbiwgU2luZ2Fwb3Jl
LCBUaGFpbGFuZCwgYW5kIFZpZXRuYW0uIFdlIGNvbmZvcm0gdG8gaW50ZXJuYXRpb25hbCBzdGFu
ZGFyZHMgbGlrZSBHQiwgSklTLCBESU4sIGFuZCBBSVNJLCBvZmZlcmluZyB0YWlsb3JlZCBtYW51
ZmFjdHVyaW5nIHNvbHV0aW9ucyB0byBtZWV0IGN1c3RvbWVyIHJlcXVpcmVtZW50cy4gT3VyIHBy
b2R1Y3RzIGFjaGlldmUgcHJlY2lzaW9uIHdpdGggZ2VvbWV0cmljIHRvbGVyYW5jZXMgYXMgbG93
IGFzIDAuMDAxbW0sIHdoaWxlIGZpbmlzaGVzIHJlYWNoIHdpdGhpbiBSYTAuMi4NCg0KSSBhbSBl
YWdlciB0byBleHBsb3JlIGhvdyB3ZSBjYW4gYXNzaXN0IHdpdGggeW91ciB1cGNvbWluZyBwcm9q
ZWN0cyBhbmQgY29udHJpYnV0ZSB0byB5b3VyIHN1Y2Nlc3MuIFRoYW5rIHlvdSBmb3IgY29uc2lk
ZXJpbmcgQ05NIENhc3RpbmcgYXMgeW91ciB2YWx1ZWQgcGFydG5lci4gSSBhbSB0aHJpbGxlZCBh
Ym91dCB0aGUgb3Bwb3J0dW5pdHkgdG8gY29sbGFib3JhdGUgd2l0aCB5b3UuDQoNCk1heSBlYWNo
IGRheSBiZSBiZXR0ZXIgdGhhbiB0aGUgbGFzdCENClRlbCA6ICs4NiAxODU2NTc5MjA4Mw0KQVRU
TjogQmlsbCBMaXUNCg==




