Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DE2CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDqdoJk9lubv55rDAuOytv8/K4Mn4cbUmQU9E/sNBGg=; b=Mc1DB0wK4/1BRahlYWAzG2+4Hp
	3vOXCmOtanpGdug/AbE5HeSc5iKHhvhatAlNnvht/LxqFVxUW5WQP5+iZCS6L8PHsV632uPL+eeRy
	iCZdy/rojW/BypZtVA+ibImHV9HVH+Lof59DQ8MEvPNh8YdJBOaniD6z4SnC69feneo9Xdu1gTudO
	lS5t9F2uRC+PAPLX2gsv3xDlxffMuL4TEMsNc88KgBkHNgP1ulaHs9RH8aW+en+09ip5hDMWHcI2T
	21lM31IzEFT0thCsyLL7ooCmyX9BNDKcZ+vZEfiD0LB87Cm7VIR0I+E19RoJbPhwQzIvFPtRGv5Ta
	/Wn+mmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Amw-00000002d4c-1nkf;
	Fri, 26 Sep 2025 15:55:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Ams-00000002d43-3Iw4;
	Fri, 26 Sep 2025 15:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LDqdoJk9lubv55rDAuOytv8/K4Mn4cbUmQU9E/sNBGg=; b=Yt/mIccIH8D+vqtslbMH4u7aif
	Lh9lE2zaAFQ4JJvskOU91hQF3wzOQsRIZ5xafcxXCaUlKqUvTBuqg/aEfiEP5bBykK3Ytnq2ETOH7
	26tZlKzlxGkY96gLhDoQQ0AeNakHSegmpTVeOFmtTV3jXOYLiUgudWdAyib1ZH+icivk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v2Amf-009a1U-Q7; Fri, 26 Sep 2025 17:54:57 +0200
Date: Fri, 26 Sep 2025 17:54:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: airoha: npu: Add 7583 SoC support
Message-ID: <82a08bb5-cbc3-4bba-abad-393092d66557@lunn.ch>
References: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
 <20250926-airoha-npu-7583-v1-2-447e5e2df08d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-airoha-npu-7583-v1-2-447e5e2df08d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_085510_826442_82AC0CCA 
X-CRM114-Status: UNSURE (   8.89  )
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

> -	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
> +	if (of_device_is_compatible(dev->of_node, "airoha,an7583-npu"))
> +		fw_name = NPU_AN7583_FIRMWARE_DATA;
> +	else
> +		fw_name = NPU_EN7581_FIRMWARE_DATA;
> +	ret = request_firmware(&fw, fw_name, dev);
>  	if (ret)
>  		return ret == -ENOENT ? -EPROBE_DEFER : ret;
>  
> @@ -612,6 +623,7 @@ EXPORT_SYMBOL_GPL(airoha_npu_put);
>  
>  static const struct of_device_id of_airoha_npu_match[] = {
>  	{ .compatible = "airoha,en7581-npu" },
> +	{ .compatible = "airoha,an7583-npu" },

It would be more normal to make use of the void * in of_device_id to
have per compatible data, such are firmware name.

	Andrew

