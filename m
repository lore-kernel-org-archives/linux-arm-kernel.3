Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A42CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 22:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ib1iU3Qxw19Ut1WEzRnfFFufKNvW6qoaUWizLUq11Q=; b=bPOfBT8F4orWmDoM/y+NV3RPGm
	E2EOxl6qqB8Lfy1qAZViZQufeONwJt3IfqXrV6CDyr6nKXn9LvtgEMiB8bQpUPzZhLwbXYgX7INs7
	azR0aPv1zHmsBJ/RX6HesJ1VpM/kbZjk4NUwUZcwwqpbihoYfaaOWx6FQMroy9dREFE0ENpyO8iZw
	9ElIjUfQiHEBO2SQ4egRV2LBQpk1zGxjehzghm98JfM7ZAkpZSQMSobrlDr7i1jiuz9VT2czzk72Q
	EWdYJbwwkrZdNKChOCjfDwILSgdx8vYaUKQR7I57Hy5htqBIRit5GbGVGKMf1oD6T/H7vpiK+oqiR
	AXUjUu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8n81-0000000HWAE-2LZy;
	Tue, 14 Oct 2025 22:04:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8n7z-0000000HW9O-1Vza
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 22:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760479451;
	bh=3ib1iU3Qxw19Ut1WEzRnfFFufKNvW6qoaUWizLUq11Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RFfXKzkLQtwUueDyCrkSuazpG44SGbxqEHdEVqA6yRD7EsZxBZcdlMsE+zAhISIeA
	 2pxWVSQWI3POKOY1yaS+c0Zmq0hVWF0BVwVLUcSKkuOjxEo4du64sz0+3f8eqc8ppV
	 9AFbkGKLp8TAGcRnlg29Nb57Ax2cf4tly1tUNCp6wHzoTby0gn4Zc5FM/9vfsm7t1l
	 za6awf81wSsV/ZXamUjdMf98iKiPeYBa1IdjJn5R+9qgvbk0a4e15gdnLjv+wr8NEP
	 BrwCGW/HlU/YsqccXVvyIqWJGK/d6eOLB3gkZ+g9cXYT/o+uTQNdCQAnSpo6UrGbI1
	 0uj+NvXVHyfuA==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 974387699E;
	Wed, 15 Oct 2025 06:04:09 +0800 (AWST)
Message-ID: <b387257937922d62fbf6bf6377470cfa8a46da2f.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: ipmi: Convert aspeed,ast2400-ibt-bmc to DT
 schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Corey Minyard
 <corey@minyard.net>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 15 Oct 2025 08:34:05 +1030
In-Reply-To: <20251014152948.3782738-1-robh@kernel.org>
References: <20251014152948.3782738-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_150419_612828_551167E4 
X-CRM114-Status: UNSURE (   5.06  )
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

On Tue, 2025-10-14 at 10:29 -0500, Rob Herring (Arm) wrote:
> Convert the aspeed,ast2400-ibt-bmc binding to DT schema format. It's a
> straight-forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks Rob.

