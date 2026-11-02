Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8F606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WdKC9bLm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A3GjgjLPBUrnD3kzEtH7HKFnqwNdS3wRA6X8t8xa4es=; b=WdKC9bLmSF3Fji
	sKeHK/ugk8AnNXis33zUYKCKF5C94s81ZUgQ9w3YWNBSD/PQxKIRIdWABMTbQvwJgOFnal/n6ELIL
	cSvDBCfg70WECqiHBd7WXLA2DBn3nnm03luQNM7VVBI27fmTDaUMe2XTHIG3qUt2+/JTNouZxL4bC
	j/5gxyJK+RdQLrtTc/7j9wHKm0Kk3MzZewZpH46InrUUhxYbX5GT0eaeobaZdK7QJdqAHN7hgJr9D
	rLwzXeJ3cXC7lHxYY8GrrgO5v2LbFKfyiDl6NkJ3y7W7vUvS4o5hm4hjzKdr8IiPf0MIhFfJP9bm+
	ReGWqwxHOmQPf+ytCDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqdN-0000000GOmt-3fvE;
	Mon, 02 Nov 2026 11:55:29 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqdJ-0000000GOm2-19RP;
	Mon, 02 Nov 2026 11:55:29 +0000
Received: from Vostro-3710.lan (unknown [IPV6:240e:3bc:2e87:1c50:1c8e:3f10:8458:b32f])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5330b226c;
	Mon, 2 Nov 2026 19:50:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: bigfoot@classfun.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Mon,  2 Nov 2026 19:50:01 +0800
Message-Id: <20261102115001.1820171-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101192807.897562-6-coiaprant@gmail.com>
References: <20261101192807.897562-6-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19c18750403a2kunm632ef75ce7f31
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTE4ZVkNJHxpPSR5MS0wdS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUgZGEFJHkNMQUoYTktBShhDHkFIHUpLQUNPTkNBGU
	hJHVlXWRYaDxIVHRRZQVlPS0hVSktISkxMSVVKS0tVSkJLS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_035525_527045_9C95710F 
X-CRM114-Status: UNSURE (   5.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> +	/* actually fed by vccin_5v, dependent on vcc5v0_usb30_otg0 */
> +	vcc5v0_usb30_otg0_boost: regulator-vcc5v0-boost {

This is incorrect from the schematic:

VBAT -> 5V_BOOST / 5V_OUT regulator
                 |
Boost_EN ---------

5V_OUT -----
            |-> VCC5V0_USB30_OTG0 -> USB3 VBUS
VCCIN_5V ---            |
                        |
USB_HOST_PWREN_H -------

So you should modify the vin-supply of vcc5v0_usb30_otg0.

> +		regulator-name = "vcc5v0_boost";

vcc5v_boost

> +		vin-supply = <&vcc5v0_usb30_otg0>;
> +	};

vccin_5v: vbat: regulator-vccin-5v {
vin-supply = <&vbat>;

> +		vcc5v0_boost_en: vcc5v0-boost-en {

boost_en

