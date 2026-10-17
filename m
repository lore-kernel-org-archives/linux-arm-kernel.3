Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18273CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 03:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJerTsz81r38Lu15HZf4hJIHhOGCfMms4JugNb/dsME=; b=CqxLP8T+77XC3qHKH7/PciN2Ll
	9BQGDg/7OXcyTdb8CJ76p/0i/KgV+a+U4oYW/4m92SkYAx5dHNUJYGTpJJwWi2lRjSX51afPu18Jr
	UEBMMFFUKy+dbCpv5JlhlZZA5yf657dgGVBNfiI3/JU4jIaS8BzQC32Zc0DvgcoXUoiriBGPApW4O
	j8XDIPjgrRY2YehYnyllnFbAzexNByy+IDc0N7zczbTpTlsOeLlZTn0w0kX3LmqXOYr+cQqcKNjf/
	RXSM7ZZ4S5DAQZC1N2Qi3mdvzKhC4s0CKEQYmRhEJdLp8vnDqwtzWS8pZMCUqNYlGjs/Y+g9PGqva
	Ar4EZz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHvK5-00000004OBz-2Cod;
	Sat, 17 Oct 2026 03:43:05 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHvK0-00000004OBU-3YBY;
	Sat, 17 Oct 2026 03:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792208576; bh=IJerTsz81r38Lu15HZf4hJIHhOGCfMms4JugNb/dsME=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=iZ1WZnvmP0UgbKX1bbGEoK0kDWP0HZlrhxOdMjhEVR04MC9vqi/sL5AAU30DGjHWh
	 6Byp6bVZs1MHaK/d7EpzZ1M5y773BPRmPFST6s4gTC5XeMiOz7l70UZfoeSwg9S/Gi
	 YNfWla7RIXeiQRA0AyKAeRwpUJJdUx7zj6sCNKTY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-XMAILINFO: NSJPTvnisrLj8wYCImFMHtnbfUIUrHAx6PvluKs+g2oQLbqcVRcJSfuBcVZi8A
	 3S6K3AJ9XY2PBPtPafsNigyty01JlIh2DiQMP98xjjHKxjVA8y5pEblgtwz6GTPTZFYvn2bb8lUiN
	 g4xxRhYyddD2rWNTWI6TUACh7LGt4SGvSbku3uIx5Q1JPDwIIcBV8+L976Xz7pK0I3T996x+CVOQr
	 Bb7bBr/HVOFxxCxyTMMSOIUGHLz7Q0EtewJolS4d8Ac41C34TlZjhrhtN8bxNtNywy1ujMMkkd4JV
	 //s4b79C/ScJapoenMUcTRvmm5b6DxMZDQ/szS4Re9YHWPzB6j2OEpLTPlSqR7FglFRWIK//JF2p6
	 jml3tYO26gzphLflxNyaYTNseBMSxwtr8wbTYByithwGVxUTamUlzVIcPSagPMx5Q6QRMCFERKGEE
	 MTreGbpNuxEqUhFJMu1T+RHZwe1So6h8oAvZAPTsNWuNHdMNcTYlNXOLUMAYD9FOhQmUlwrCuJ8QB
	 G9B0e9YH0pm3IC6bwbHwOcFXpywq5vfzQHvlIa17hYK0JTCaC0W++DPbqYbLL3HNe6nuwU/tha+dQ
	 Z9dgkn19JoNSDlGi47qwHjW3xcf5lKKUntMT2sZ7zeqKbsa9XBXZFd4/JE2WYW+26Mg4UV3t8k6wv
	 aYnp6IsSbIi2ZzrBjMTRVlzFizRDP59yOMTgobaMYTSyRGKf/i09sMleXrUOZjntzRJiNN5E5F/yV
	 1ReCXSUXlFn+Ptyx9qP2+Sb2oFz/IlkXZUHGKs9v9Q8H7yursXo8+4D5UejOjKwA4vcNBC90i4pm7
	 0LG/s2fVZLNbQmhCqAPpl8hRlf2Qgizd0CMXHTbJ7pxZNL+nsuaWbbvPnD7WsV3Blt3k9lwmqZoDf
	 3JJsKqzVXNKR179r78Q65DqDmyWasLoL0Qsfg1Pkb1UWVuEksPTwsysie8uUUDZ3/iyF3u7KuefqD
	 +sJaoYck9ZBN8HddAngnVvWDcNASOlttI5O47dfhlCTNm+8XnegR6fGVxdtjL2owdG60nBoMg+2S4
	 Q90dze2izJJyTcefwhAFzVdWYlpmm3zCYh24kmnmFiEs2A/8Ik+WjecL0nrIRhGW7cK8S
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?bmV0ZGV2LWJvdCtzYXNoaWtv?=" <netdev-bot+sashiko@kernel.org>
Cc: "=?utf-8?B?bWts?=" <mkl@pengutronix.de>, "=?utf-8?B?bWFpbGhvbA==?=" <mailhol@kernel.org>, "=?utf-8?B?aGVpa28=?=" <heiko@sntech.de>, "=?utf-8?B?ZGF2ZW0=?=" <davem@davemloft.net>, "=?utf-8?B?d2c=?=" <wg@grandegger.com>, "=?utf-8?B?c29ja2V0Y2Fu?=" <socketcan@hartkopp.net>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>, "=?utf-8?B?a3ViYQ==?=" <kuba@kernel.org>
Subject: Re: [PATCH net v5 2/6] can: dev: add close_candev_cancel_restart_sync()
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 17 Oct 2026 11:42:53 +0800
X-Priority: 3
Message-ID: <tencent_BCC00222B29F6013030D8F0C6C02DEC84E06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261015-rockchip-canfd-restart-close-v5-2-ae77327037c9@qq.com>
	<179219884300.1406898.17794218418731765550@kernel.org>
In-Reply-To: <179219884300.1406898.17794218418731765550@kernel.org>
X-QQ-mid: xmsezb41-0t1792208573tmm7xzz68
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_204301_448182_A980DB83 
X-CRM114-Status: GOOD (  15.89  )
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

SGksCgo+IFtTZXZlcml0eTogTG93XQo+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCBjb3VsZCB0
aGUgY29tbWl0IG1lc3NhZ2Ugc2F5IHdoeSB0aGlzIGlzIGdvaW5nIHRvCj4gc3RhYmxlPwo+
Cj4gT24gaXRzIG93biwgdGhlIHBhdGNoIGlzIGEgbm8tb3AgcmVmYWN0b3Igb2YgY2xvc2Vf
Y2FuZGV2KCkgcGx1cyBhIG5ldwo+IGhlbHBlci4gSXQgaGFzIG5vIEZpeGVzOiB0YWcgYW5k
IG5vICIjIHByZXJlcXVpc2l0ZSBmb3IgLi4uIiBhbm5vdGF0aW9uLgoKVGhpcyBwYXRjaCBp
cyBhIHByZXJlcXVpc2l0ZSBmb3IgdGhlIG5leHQgcGF0Y2gsICJjYW46IHJvY2tjaGlwX2Nh
bmZkOgpjYW5jZWwgYnVzLW9mZiByZXN0YXJ0IGJlZm9yZSBjbG9zaW5nIHRoZSBkZXZpY2Ui
LgoKPiBbU2V2ZXJpdHk6IExvd10KPiBJbiB0aGlzIHBhdGNoLCB0aGUgb25seSBjYWxsZXIg
b2YgY2xvc2VfY2FuZGV2X2NhbmNlbF9yZXN0YXJ0X3N5bmMoKSBpcwo+IGNsb3NlX2NhbmRl
digpIGluIGRyaXZlcnMvbmV0L2Nhbi9kZXYvZGV2LmMsIGFuZCB0aGF0IGNvbnZlcnNpb24g
a2VlcHMKPiB0aGUgb2xkIGJlaGF2aW91ci4gQXMgYSByZXN1bHQsIG5vIGRyaXZlcidzIG5k
b19zdG9wIGdldHMgdGhlIGVhcmx5Cj4gY2FuY2VsbGF0aW9uIHRoYXQgdGhlIGNvbW1pdCBt
ZXNzYWdlIGRlc2NyaWJlcy4KPiAuLi4KPiBDb3VsZCB0aGUgY29tbWl0IG1lc3NhZ2UgbWVu
dGlvbiB0aGF0IHVzZXIsIHNvIHRoZSBoZWxwZXIgZG9lc24ndCBsb29rCj4gdW51c2VkIHdo
ZW4gdGhpcyBwYXRjaCBpcyByZXZpZXdlZCBhbG9uZT8KClllcy4gVGhlIGZvbGxvd2luZyBS
b2NrY2hpcCBwYXRjaCBpcyB0aGUgaW50ZW5kZWQgdXNlci4gVGhlIGN1cnJlbnQKY29tbWl0
IG1lc3NhZ2UgZXhwbGFpbnMgd2h5IGRyaXZlcnMgbmVlZCB0aGUgaGVscGVyLCBidXQgZG9l
cyBub3QKZXhwbGljaXRseSBuYW1lIHRoYXQgdXNlci4gVGhlIGNvbnZlcnNpb24gb2YgY2xv
c2VfY2FuZGV2KCkgaW50ZW50aW9uYWxseQpwcmVzZXJ2ZXMgaXRzIGV4aXN0aW5nIGJlaGF2
aW91ci4KCklmIHY2IGlzIG5lZWRlZCwgSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3Nh
Z2UgdG8gY2xhcmlmeSB0aGlzLgoKUmVnYXJkcywKQ3VuaGFvIEx1Cg==


