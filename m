Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7F106FD9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0tqqF6XkZYZpqUcuN1JR0OKYYyQ68kRuK7Q1mLhw+w=; b=m8VBIhfUQRaTyvskHTyRVyKCLp
	r1h/4Xxl4U/y935P5CKsFA3RRUhEdLoCB70jjcOSuox7qkEuiUmeZFaC2hodcyG1VcfWCuBHBaIbI
	0d9ypl6NFUUo5ytyjSlLAxdgA7y7HY5Me2cuwCLJWkli2al7WdaGN4BgD+m/yiyCauQpl3MP9ZLg+
	6cCiNm6rAf2X9txSvepaCQgQWVmvj4L6uRXZ4xZvbt/TTRfb/eUBv43YDgP+HaCpkZeRXQmhAH3wU
	ryWxQ6ekuUFOe/N27DYF9wwVhuvSk3dBn6NC0MOkDTY7wizQwWKDQD/QZHZr35tzpVed16x1ugKGV
	4WU3ezRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xqD-0000000HF44-0kOL;
	Fri, 13 Mar 2026 08:25:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xqC-0000000HF3i-1vcU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E98746012B;
	Fri, 13 Mar 2026 08:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DF7C19421;
	Fri, 13 Mar 2026 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390350;
	bh=e0tqqF6XkZYZpqUcuN1JR0OKYYyQ68kRuK7Q1mLhw+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMGGPc2UegGprIlz956kluFuY01oBhvuv6TF3vxRVL/RmvaspfSjv+fdGgd9jiBHz
	 jVlSIWTfgl1NR8OI6EvFGP0oD9st5fwUmbnORdNY0Wm5PMd1zEmV3G7cRwKtym7goU
	 A6T0AmTgNoMLvtfIrt7eFkZfv8MFtj0aZ+xHuwlZYGanznUVoNB2QV05dOllFjV8eu
	 6/sgmuVAzRBrVa2uSO/EAVbBQv3T7YUBVbQcqioIgDwPvmu2Z/80Y7XuLCyHOjv18G
	 Kw7Iola19LzXHn7k+5fyt4XRAy8MQzwy7wBLuXm2EC5TSUVDgkBzw92n89c9Aamu5q
	 mqb97+lm3dmcw==
Date: Fri, 13 Mar 2026 09:25:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.chen@cixtech.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: cix,sky1-pcie-host: Add
 power-domains
Message-ID: <20260313-piquant-robin-of-honor-cb9f39@quoll>
References: <20260313060308.1300518-1-gary.yang@cixtech.com>
 <20260313060308.1300518-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313060308.1300518-2-gary.yang@cixtech.com>
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

On Fri, Mar 13, 2026 at 02:03:07PM +0800, Gary Yang wrote:
> add power-domains and power-domain-names property

Nothing improved.

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof


