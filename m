Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354BAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fVlbPyZGXATH2z5WzJ6VMWNrQv8f/QALE3Mh5Gazek=; b=3m+ErMHkLvV3u00WHLbfCPGs5+
	vjz0rAMVEiYJzkxma6/IC5aZu/2KNmyas0uBA2cD/1K0ABhxGolsEB7j4NnRtlwqy0mfA1uemMBkd
	8GkIZ3A7ocVTCT1LV+SAC57SlmSVEIm3oxy5woFVRnM9lB2rRr7O8Ri6q6xkDaUVZ0nMfdAQpwcDA
	r3j3Q6MfCmHDZ2A9deF03P93z9is3z+e49t7UZRXJXXE17JMhkajs4IAQj/9hC4wPjZwZ1pYSZmji
	1Dq1ruOcQjpU9JlPrJiqqQ0nWOW8Fh9auuygCw/moyJBwYfFdP5scOdHxxjpSMpV4eHkiLabOJUj+
	HT2QrTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJIO-00000004njH-0l2c;
	Thu, 02 Jul 2026 15:25:44 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJII-00000004ngH-2mgv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783005934; bh=/fVlbPyZGXATH2z5WzJ6VMWNrQv8f/QALE3Mh5Gazek=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=jOw38DtwTid4VzpEnbj+r04pW7YwOs2EGmDAWheynYT8NBxM8OKwtqY3ZdbudSWzz
	 uCU5yFUGRx9LB2T0HwlJOm+WPYXFD1rWndkJKWT08TRY9lNSiaRDgaEC0vDGCLWSBP
	 nYegymS2USlIRyC+w/5RD8Aits0SNxHuLDdaGCdU=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: OMqlb7aP4Kjek7vshZOnZvDZb5+pT3yBZiNHZ2hUy7w914sLyLT+p04C4P4x9K
	 rkZ+UKZDF1Ze7T+AawbmzHHGc26F1svH7n53Pvt+ALBPPxl0IPtoRBjpyAJa//Esxs17tB/Auzk6u
	 1Lajtt9xuWDgjgrIjlher+7Hl63RNJawzBh26kiI8HTEW7VCfaHYk1NUFjjwLB3HgoBfJKB4EZ5ig
	 oCav9Hj+HJ/1LklYGXN+XwS9+3qQc6feB0IVzWrvgZg82gW45ooi3e2LaeHj8eULaFH88D1vtIIeK
	 aRJ8FQ/0gnwG2d8Qc0WE8fy4tIfo+SGJZ2CMSCuldorzRe0jzui3TVT/d2Z1rYDbB3okr2mC6Xbcg
	 WmcdNFUq92zXv+2WD1HcQJxAMK8TmZ+cjFKsVMCgu8qw1I6veBYoegqV1FK4vpAcHWrt7qhQG1+oA
	 57TMkADUVea3y7+vBjr4hLDQ1rRKOYeIue1+tepREdsO6WMXGjiLoD4L/up6XbC4JV2vAXqliu1Di
	 lo9Tyqbtg73CTbtd+xPA84EFFoas8G7kI5JGaKZl/EPw7CZXoOFe9pw8iE/P2Q6VzzSyqu0lwUzzj
	 rGPtrF5sxqDcCPEoMYs0tSA73FRjVaU2ACsERW1/O+iT/m3u6qCaKUBtp7xbtrf8kQNdKEHWLNOOq
	 RfRgsqQlQAr9asLRI1XXDQsfiSaQ3JKY2Fe9gcGuk4501d1ceO389TNWiSnbrP+969Ap0kvgP1u3q
	 tL8gcilPGFjtI1bRpu+oI64kWmPJHE5aNl+iGuW2GLaRzJKymPzMWa4hnF4YN5qTiYFoDRrAzKvOv
	 MpvRkwsqG+nL1+o6H0bdP96Niaz3Kx8ekjPGky+WG9QryPnXSD2+jeiSx/WwQCB7vCgiXVQI6JdOe
	 0lNdNfU8d6yxbgOp/yTbeZ3liRCydfFKcFefzHxySIvRVU4NKKyeKcdXJ1QsAiE0+xpr3HqsJpSfQ
	 KwymHuUnQhjREoVqEjPLCOqZ4Am0ruyU/Ej1t43Yo++L6XbjHzGMomiwFxp05yhQbm3wGZYN46kWD
	 6G7VmL3dax4MsHfb3Lx972hi5U4ZlXAyBeiI9w9WZKxkMkXiBgcx/x+e2vWeJh291utzlraY9looR
	 5LW5dLsDH1GlvTOz97hK3tRe
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk@kernel.org>, "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>
Cc: "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?RG1pdHJ5IFRvcm9raG92?=" <dmitry.torokhov@gmail.com>, "=?utf-8?B?U2hlbmdqaXUgV2FuZw==?=" <shengjiu.wang@nxp.com>, "=?utf-8?B?UGVuZ3BlbmcgSG91?=" <pengpeng@iscas.ac.cn>, "=?utf-8?B?UnVzc2VsbCBLaW5n?=" <rmk+kernel@armlinux.org.uk>, "=?utf-8?B?RXJpYyBCaWdnZXJz?=" <ebiggers@kernel.org>, "=?utf-8?B?TWFyaW8gTGltb25jaWVsbG8=?=" <mario.limonciello@amd.com>, "=?utf-8?B?S2FybCBNZWhsdHJldHRlcg==?=" <kmehltretter@gmail.com>, "=?utf-8?B?WWl4dW4gTGFu?=" <dlan@kernel.org>, 
	"=?utf-8?B?U3RlcGhlbiBCb3lk?=" <sboyd@kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 2 Jul 2026 23:25:31 +0800
X-Priority: 3
Message-ID: <tencent_190046D203F61069FC109A4268AC654C1309@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20260702140654.2961561-1-1579567540@qq.com>
 <tencent_3B2B6003D1DE4FB7A984665A062581766405@qq.com>
	<ec548326-dd8d-4d81-8500-ed4c4c30ddb2@kernel.org>
In-Reply-To: <ec548326-dd8d-4d81-8500-ed4c4c30ddb2@kernel.org>
X-QQ-mid: xmsezb41-0t1783005931tqwjx3m1m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_082539_017351_A9C89614 
X-CRM114-Status: GOOD (  13.86  )
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

CkhpIEtyenlzenRvZiwKClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCgo+ID4gQWRk
IGEgZGVkaWNhdGVkIHJvY2tjaGlwLHJrMzU4OC1jYW5mZCBjb21wYXRpYmxlIHRvIGRlc2Ny
aWJlIHRoaXMKPiA+IHZhcmlhbnQuIERvIG5vdCB1c2Ugcm9ja2NoaXAscmszNTY4djItY2Fu
ZmQgYXMgYSBmYWxsYmFjaywgYmVjYXVzZSB0aGF0Cj4gPiB3b3VsZCBkZXNjcmliZSBhIHJl
Z2lzdGVyIGxheW91dCB0aGF0IGRvZXMgbm90IG1hdGNoIHRoZSBoYXJkd2FyZS4KPiA+IAo+
ID4gQ2hhbmdlcyBpbiB2MjoKPiAKPiBDaGFuZ2Vsb2cgZ29lcyB0byBjaGFuZ2Vsb2csIHNv
IC0tLS4KPiAKPiBTZWUgYWxzbyBzdWJtaXR0aW5nIHBhdGNoZXMgb3IganVzdCBzdGFydCB1
c2luZyBiNCwgd2hpY2ggd291bGQgc29sdmUKPiBhbHNvIHlvdXIgYnJva2VuIHRocmVhZGlu
ZyBwcm9ibGVtLgo+IAoKSSB3aWxsIG1vdmUgaXQgYmVsb3cgLS0tIGluIHYzLiBBdCB0aGUg
c2FtZSB0aW1lLCBJJ2xsIGFsc28gc3BlbmQgc29tZSB0aW1lCmxlYXJuaW5nIGhvdyB0byB1
c2UgYjQsIGFuZCB3aWxsIHVzZSBiNCB0byBzZW5kIHRoZSBuZXh0IHYzIHN1Ym1pc3Npb24u
CgpCZXN0IHJlZ2FyZHMsCkN1bmhhbwo=


