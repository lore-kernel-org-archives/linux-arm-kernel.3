Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA5AD262B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XR1YrykcCrB/U4JVWFqaA5MT4lAQyvBo6axzkocsG8=; b=VdOkRy+PkDHmXojR4SpB4As8zK
	C3WN6kTGdyBAaqBy8RZYDRS38glB0yDHAEK41uQ1GuWnE0YULhCnXrKC0XqFKTb1yTZ5VSi+I46Ed
	EDwFQPnYS3DBfcdvLv7QJr6NeAlznCTPNbQHK83EVrKDrpp5sDZUlvO4I0yJxk06UNlz3cfOAIc0s
	3UT0+sHuurSsogeWjB2FWInUwpVPvZVAsNijAooT239c7Im8n3EChQz/tiGcd2ahNfiLTu4X8DSqd
	wtsP6rOjhSHOPJwVcoB5nmiOQywFBIIRSGQgyIcn+O2bBu0eMjtM7dHkBNvdVeTEif7aUtEECB1Kg
	wTtPf51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNpL-00000004mLg-1Mal;
	Wed, 21 Jan 2026 02:20:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNpI-00000004mKt-2rgp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3C3443B88;
	Wed, 21 Jan 2026 02:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCFBC19425;
	Wed, 21 Jan 2026 02:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962007;
	bh=0nU4w252q2DLRZ1F2BgYWeOeH4dQbxVKvzzaFa9j4I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVYKMaQ2cHRQNeAi9n25y0Dv91VfSuogevihUsmk2HR9BuNwnDZrw9Q455PhpWHjd
	 J7lJB/eGzMzezrSzvAKD3s+heJlgmi8IW+NFcC7cj+KofCbN0IznoWFTqTrID1pBcO
	 0ez7ADlglRFbcBRqRSKO8kLdV85TQ6xZcgxRHpKN5zLRCQx9t7DF8drFDVvqgLeBU3
	 61FGgO+9OQvI/pgSxEfSZGuVXQvuWH/OMfZUH6vRuRqtIjopbkdMZ4hfjbRo5IF3VY
	 arLgb8ZMcTQekrLJsWpNivH/dME9bgT+sARcCWS/zP+Frz9iQFRIYQRfYg9OZaavC2
	 DqbGyVoBtBE4Q==
Date: Tue, 20 Jan 2026 20:20:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: nicolas.ferre@microchip.com, UNGLinuxDriver@microchip.com,
	gregkh@linuxfoundation.org, horatiu.vultur@microchip.com,
	andrew+netdev@lunn.ch, luka.perkov@sartura.hr,
	lars.povlsen@microchip.com, lee@kernel.org, kuba@kernel.org,
	linusw@kernel.org, richardcochran@gmail.com,
	Steen.Hegelund@microchip.com, richard.genoud@bootlin.com,
	kavyasree.kotagiri@microchip.com, davem@davemloft.net,
	krzk+dt@kernel.org, linux-spi@vger.kernel.org,
	daniel.machon@microchip.com, linux-kernel@vger.kernel.org,
	edumazet@google.com, linux-crypto@vger.kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pabeni@redhat.com,
	tudor.ambarus@linaro.org, claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au, alexandre.belloni@bootlin.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	linux-serial@vger.kernel.org, Ryan.Wanner@microchip.com
Subject: Re: [PATCH v5 10/11] dt-bindings: net: sparx5: do not require phys
 when RGMII is used
Message-ID: <176896200632.1779741.2061551364132854431.robh@kernel.org>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-11-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115114021.111324-11-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_182008_737554_42E3BE82 
X-CRM114-Status: GOOD (  10.00  )
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


On Thu, 15 Jan 2026 12:37:35 +0100, Robert Marko wrote:
> LAN969x has 2 dedicated RGMII ports, so regular SERDES lanes are not used
> for RGMII.
> 
> So, lets not require phys to be defined when any of the rgmii phy-modes are
> set.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/net/microchip,sparx5-switch.yaml     | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


