Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE227D1CDAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 00:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWBsNUAQJIiGx0STKoYuLr8WVpYlwo8t8SdzJPcQFDQ=; b=Y0bR4sVxrSc200LQNZtNaFra4z
	ZyBhfM9DLf+a8q4HlR3BgmggMQnWCqtPCgHMtlXFwAgkJBwDhHxbVN/BA694tQUdb8KFjLATUn7bE
	v+3PTlXpMF/D5Ib+Z5gREJ/eSAHn2vnlcVh9EuA/PwGUlfT4JAbpnP4zRfdm2k4aIxSucf6uMFSZW
	puJhMS2lyWecje/Y/JLzFwD0np0tfKsUnsBdcAPicfNH+Kvq12WYPIJNivNfQKnC7pXQxgMBWZn4R
	xgaLwSk5mn1FZokAzplw77/ypTuM+hce4x4z1l/y5cBbNs7fiLz4S2gzgaq4dE8UfHikoypjy3wZT
	JrcGAkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQxER-00000007IMt-0Biw;
	Thu, 04 Dec 2025 00:30:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQxEO-00000007ILp-0k4d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 00:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764808198;
	bh=vWBsNUAQJIiGx0STKoYuLr8WVpYlwo8t8SdzJPcQFDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=doUBzLPza/HGmbXlMjkGYgJH9J3XGP0tOvNLFlG+2hodaoSzhigj/6guKQWwq5h0K
	 QGcU9DaIIuGaix4BL40TQpecxf0jLfcNpltp6Oqi5S344wKqq1RTlXE517s0zyTfWo
	 BQKjnmitUEpkumV4dZmPOPHRomMJmVyBrSTozxK5L+hDnGq0FWvO2TfGy+kSraiPmN
	 nVJwwU3jeYMMGihBl6l2QkaZ9SrMZJ07I91cPlldkzhz/gyrnWXGu7W/jjwXdLjmnP
	 mERV0shEXTBP8l8IH7VCmXiHCexozLwRJDmnG3jg1sDrU0zngz/kmW3ERo6B7WHtZK
	 mTZ5ht8aTUVHw==
Received: from [127.0.1.1] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AAAD0706D2;
	Thu,  4 Dec 2025 08:29:56 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Marc Olberding <molberding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251126-msx1_devicetree-v5-0-e508d13e2dda@nvidia.com>
References: <20251126-msx1_devicetree-v5-0-e508d13e2dda@nvidia.com>
Subject: Re: [PATCH v5 0/2] Add device tree for NVIDIA BMC MSX4 CX8
 switchboard
Message-Id: <176480819607.976941.8757303196020007882.b4-ty@codeconstruct.com.au>
Date: Thu, 04 Dec 2025 10:59:56 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_163000_414123_D6F8A302 
X-CRM114-Status: UNSURE (   8.09  )
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

On Wed, 26 Nov 2025 16:43:05 -0800, Marc Olberding wrote:
> Patch 1 Adds the binding for the MSX4 CX8 switchboard
> Patch 2 Adds the device tree for the MSX4 CX8 switchboard reference implementation.
> 
> This is an Aspeed AST2600 based reference implementation for a BMC
> managing the NVIDIA MGX CX8 switchboard.
> 
> Reference to Ast2600 Soc [1].
> Reference to host architecture [2].
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


