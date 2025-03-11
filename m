Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D330CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jir35b0HgpV0FY6FTSTtKnirvFZaxaNLyjhlogfMqV4=; b=gf7Fm7f809tH9bXrcS/F1qQYIv
	/Mmy4kNjqsApnMDI6Z+fLnNmelJZqOqSAfp61POaJBN92Dwejw6dKz34VTESZKZCipiRhJ5NtUlWw
	OEKM7Wl2xFhrpuysMI1RsW3T4Pu33+0bximhjJMc67159dEgeuQgok8CTpyA5dZ5fE/ZrlaLF/2bZ
	Iv0tS8xB7SXvjwGqK5yunMePHt7mJnGeJkH1OjahioA6D2v0H//PIO2//WjONVx8yRoDoKiDqt7Ai
	Cat9Nms4vD4eRAxbTn3dBTQbz8ONIFHSOkijG+ixbsZgd4wDbLx5ZVsyMI8zL19G4wZE3mPEu23kB
	lugZ0pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryoy-00000005fU8-3K6s;
	Tue, 11 Mar 2025 12:34:56 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryd4-00000005cPo-1UGB;
	Tue, 11 Mar 2025 12:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Jir35b0HgpV0FY6FTSTtKnirvFZaxaNLyjhlogfMqV4=; b=b
	72iuzjLPM9Hpdt1LvzCk0VUtgFtaH+PnzDNS29xW4zkZSribKzLwWSRMqWch/9PG
	AA36bzTdLuMmC7/JYiCJ+VlGE8L73KlPhOjuZ+QLxwgM1Jg3b7Wl7Bie4YBoEWl5
	D/F8zS8MeQ66Rt+EmWMEXDMITg2CUfBylMVTCWI6ZM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Tue, 11 Mar 2025 20:22:10 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 11 Mar 2025 20:22:10 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Vinod Koul" <vkoul@kernel.org>
Cc: heiko@sntech.de, kishon@kernel.org, sebastian.reichel@collabora.com,
	yubing.zhang@rock-chips.com, dmitry.baryshkov@linaro.org,
	frank.wang@rock-chips.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: Re: [PATCH] phy: rockchip: usbdp: Check these parameters
 only when the corresponding set flags are set
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <Z9Aa6v1/1KRdZDKE@vaman>
References: <20250306065952.485809-1-andyshrk@163.com>
 <Z86UOmPg/UDSBajZ@vaman>
 <1379400c.90c.19582b05f74.Coremail.andyshrk@163.com>
 <Z9Aa6v1/1KRdZDKE@vaman>
X-NTES-SC: AL_Qu2fA/qSuk8o5imYYOlSyjNW+7xfHKv6+qRChMQvQtsqqTHr9T0KcVtuP1XR3/++sAgV6BesM+3kGdDrWG6d
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5382b861.a48b.1958527c4dd.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgCXPn_yKtBnExV8AA--.18497W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hwNXmfQINjbaQACsi
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_052238_752345_AE6597B7 
X-CRM114-Status: UNSURE (   5.57  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

CgpIaSBWaW5vZCwKQXQgMjAyNS0wMy0xMSAxOToxMzo0NiwgIlZpbm9kIEtvdWwiIDx2a291bEBr
ZXJuZWwub3JnPiB3cm90ZToKPk9uIDExLTAzLTI1LCAwODo1MiwgQW5keSBZYW4gd3JvdGU6Cj4K
Pj4gRG8geW91IG1lYW4gd2Ugc2hvdWxkIGRvIGl0IGxpa2UgdGhpczoKPj4gCj4+IHN0YXRpYyBp
bnQgcmtfdWRwaHlfZHBfcGh5X2NvbmZpZ3VyZShzdHJ1Y3QgcGh5ICpwaHksCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bmlvbiBwaHlfY29uZmlndXJlX29wdHMgKm9w
dHMpCj4+IHsKPj4gICAgICAgICBzdHJ1Y3QgcmtfdWRwaHkgKnVkcGh5ID0gcGh5X2dldF9kcnZk
YXRhKHBoeSk7Cj4+ICAgICAgICAgc3RydWN0IHBoeV9jb25maWd1cmVfb3B0c19kcCAqZHAgPSAm
b3B0cy0+ZHA7Cj4+ICAgICAgICAgdTMyIGksIHZhbCwgbGFuZTsKPj4gICAgICAgICBpbnQgcmV0
Owo+PiAKPj4gICAgICAgIC4uLi4uLi4uLi4uLi4KPj4gICAgICAgaWYgKGRwLT5zZXRfcmF0ZSkK
Pj4gICAgICAgICAgICAJcmV0ID0gcmtfdWRwaHlfZHBfcGh5X3ZlcmlmeV9saW5rX3JhdGUoZHAt
PmxpbmtfcmF0ZSk7Cj4+ICAgICAgaWYgKGRwLT5zZXRfbGFuZXMpCj4+ICAgICAgICAgICAgICAg
ICByZXQgPSBya191ZHBoeV9kcF9waHlfdmVyaWZ5X2xpbmtfbGFuZXMoZHAtPmxhbmVzKTsKPj4g
ICAgICBpZiAoZHAtPnNldF92b2x0YXRlcykKPj4gICAgICAgICAgICAgICAgcmV0ID0gcmtfdWRw
aHlfZHBfcGh5X3ZlcmlmeV9saW5rX3ZvbHRhdGUoZHAtPnZvbHRhdGUpOwo+PiAKPj4gCj4+IEFk
ZCBoZWxwZXIgZm9yIGVhY2ggb2YgdGhlbSA/Cj4KPlRoYXQgd291bGQgbG9vayBiZXR0ZXIgZm9y
IHN1cmUKCkkgd2lsbCBkbyBhcyB0aGF0IGluIFYyLgoKVGhhbmtzCgo+Cj4tLSAKPn5WaW5vZAo=


