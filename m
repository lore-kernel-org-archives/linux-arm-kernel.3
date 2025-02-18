Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7628AC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 01:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42hWqZkaDlwsbOuKcR363GQ3gUU+QNYqERbd6QgQwlc=; b=wsICoYTZUwMidCT+WtLPcy9r3E
	r9RkuOCrn0Dr7U7flHj3HKlqXm19qQ4ialyh8qoJ4xN/hwi+0jz/vc7zk905UqI0b6YJgIS22EWO8
	8FLv7qUnWI6B+8LTJuT3Z98VM1uUUUdWecavvSWo9larGLULOuB14aSilS5y2PPAgoE1KJNAVeLQD
	9e17jh5i1pQw6CZtOXHGUvPYOIFhK5YxQ0gX4qEi2I0+JXzubqvFAQ6pV/3NV0uO0kIE/ewjlidXx
	Nh4OKhnPSIDKLx49nR6Iq5KObH4uaBcbGMUvUfqpgR1LcrbxHdKVymZllM9Nc/ZxU4LWZJonWPF83
	oiEt2Jhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkC8x-00000006PEl-1cRW;
	Tue, 18 Feb 2025 01:11:23 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkC7T-00000006Owz-2gzn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 01:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739840990;
	bh=42hWqZkaDlwsbOuKcR363GQ3gUU+QNYqERbd6QgQwlc=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=MR++2k7U+SQKF98nYBZwOBmOb2ncRe5qVWZZqcgx53Sxw3D5moRDfFaVkaHQo5NQ4
	 LbioIN1E+rcU4Wp1Hu0I4t8thOoIhVZbPzjXj93GiVOal9l27Ela+cMaKBpmCu7kJn
	 XwTfFf2rQDw6bw/3mh2fjTHBnkkNRx2UVhb/c+dhq9l6ez8P07OmspidVXdrYefeG3
	 Y+g5frhVzF8OswBMD88vkDH54VcxI7BDmHRh7iroxNDAcLKcpqMTdUkK+83LSo9H64
	 6NO4s475K8i/MJC9vvAQw0dmtxeDxdFCo+I+orlHbkbg9svQ5Orna6hLHx+edN52nm
	 Ra+qldThpmp1g==
Received: from [192.168.68.112] (ppp118-210-165-49.adl-adc-lon-bras34.tpg.internode.on.net [118.210.165.49])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1E5A876234;
	Tue, 18 Feb 2025 09:09:49 +0800 (AWST)
Message-ID: <560da647d1fd12c53f6403db4207fec48899648e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com, 
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org,  openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Tue, 18 Feb 2025 11:39:48 +1030
In-Reply-To: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_170951_883878_07E853FD 
X-CRM114-Status: UNSURE (   5.04  )
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

On Thu, 2025-02-13 at 09:53 +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER
> file.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks Jammy.

Andrew

