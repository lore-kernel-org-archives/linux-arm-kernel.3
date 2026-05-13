Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B01CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1x3ONpVhWcw+hOy+AECCEbHPSF8ly+JvDrtiYDL641Q=; b=lBz64x1R4R8zMkBtNhVnYc6nNy
	PrWsNvyT6zK15PRzaBaWC2dIg0iBJ1QtT4vhhmmet9iE3QDWvCJQpzZAGUsmQuCvHJfPGZqRLbnnh
	5j7U2W6N7jXElBc/W5yvzgWu37xMS8T/rxbxCkqnPYcFRazNp/9ocUe6gCgZ2Z3wpMMcg/HWa5XVu
	8Ebh2oE1I//R60vGLRh6c07A2a0Oe1c0PN+cZ8aDGAL7hyvoyhErmTUZvNIfcXsfoKzYdsdsLT/OT
	uYzdoyfBul2oB1KM6cLe3WT/wVjyN26uSFpQyVC/tDqrpTL2kjhGCnqQOZfwgipMLwqjOto25kj1a
	cMLjLOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ5R-000000043iM-1LUY;
	Wed, 13 May 2026 23:33:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ5Q-000000043hq-1mp0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BC8A60052;
	Wed, 13 May 2026 23:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1579C19425;
	Wed, 13 May 2026 23:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715235;
	bh=ABN00HzQ91S9l2mJfmg1rfw+l+o9zTlnJwwutFGLwM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sK6GldL0bTZVqO9OPG1ev4S3c6qMvI//wfjvKk1rZ0j69abHr9hqNO7J9Mmt6n1+o
	 PdcPGN4X7wQ80RoyXo7u+OyrlnH+PCPkf9aXiN2kXqioWMnyINK3deRFbSUoo9/1X9
	 QwOTMFJQmxv+qWAqU686nn9BgSd0m8dQCdoPNOG3TuLdb5wMD4oUjzlZhz/brJsFFb
	 WaIopn7fsArYBuXAaxdgUaZptS4nQuvEJvxbMazt2Sr71IRgyhSQx7MlEQ9PMIbCHG
	 SgUrYj5yJuLmVI7EzcBTPgoZTGFf0WDFPFBuLZP3+5/7RotCIq7KhKu76iOJbBZsPF
	 b56EUDkUpi8Ww==
Date: Wed, 13 May 2026 18:33:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: alexandre.torgue@foss.st.com, thierry.reding@gmail.com,
	mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	ukleinek@kernel.org, devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linusw@kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: stmpe: drop legacy binding
Message-ID: <177871523137.2307220.3066863194193334549.robh@kernel.org>
References: <20260508184626.15938-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508184626.15938-1-manishbaing2789@gmail.com>
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


On Fri, 08 May 2026 18:46:26 +0000, Manish Baing wrote:
> The st,stmpe-pwm binding is already covered by the MFD schema
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
> obsolete and redundant text binding file.
> 
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> ---
> Changes in v2:
> - Drop the TXT file instead of converting to YAML, as the
>   functionality is already covered by st,stmpe.yaml.
> - Update the commit subject and description to reflect the drop.
> 
>  .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


