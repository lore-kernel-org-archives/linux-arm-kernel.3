Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B868AC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LK6VpX04SwtO5xS11sN/O8n+68gw/07ItJasjDmV1c8=; b=JYhY90MYpoMlxTf7s3PKymruo5
	ROtxx+/PsQMhA81VAkf6YPhEhwPfjPn1sXPUIB8UJatrsW4s5nPY4cHNG4IimB1dGpaBRSsm5Na/8
	2pJiSvhMn/aTJtm6aKrcXXQZ0cip8sgToDXvzmaB/TbULRIu/ZJay0DsINtRg/KUPRggN9nXiP89n
	eoS+nVOhO98fkhJ4Yhd/uRK09HXGKI7XNxRgE8ohKHyIsDwGBIK3hhH064qW2by8F4hVvPYW9YO6e
	NvcJF2jZHL3P0UEndNg4h7i2vEecsuXnlk9ag4ZqPBeI+gQbsVmScaXW5AUVENb1q/0tcSCgNbYKt
	8Yn/ts4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpFk-0000000DatN-1lab;
	Wed, 04 Jun 2025 14:38:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpDd-0000000DaWX-0puA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 14:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7029DA5044C;
	Wed,  4 Jun 2025 14:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA53C4CEE4;
	Wed,  4 Jun 2025 14:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047752;
	bh=5t5I2NI/JMw2bEnJTqzhPKY9bh0Wo+3tCVbzxMva+CQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=H23h20oSkr5wnFXM8TFWBPGBAlo37cL9WeSh/3XpfRiqO85sbEluXHlyKDm6X+t4c
	 QxYRJ3LVtLul3FRNiRQzBU33RJVk/E2DSICZKHACGdrVOiF0pwy7YNX/utROFlN0xO
	 hkh/cOB0+K4gsRhr9bQV1KcPc3R+vMucXPoCviDd9Rz11hGxrmIj3xgQMPN3Gq0XXD
	 ydSmYx9TTcSovNlXaONNOmh7clCqKil33EG5EoalAZWs4zpkpwGdPjU8Em9EZe46Nn
	 ywAnKMrukcXgt2qVw3z+13ID6t4yYshD2Wy7cImNWDX/CVuTRNOUQPq88FigswQ5op
	 ybAzCNkTM9Ehg==
Date: Wed, 04 Jun 2025 09:35:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, joel@jms.id.au, linux-kernel@vger.kernel.org, 
 andrew@codeconstruct.com.au
To: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20250604125558.1614523-2-jammy_huang@aspeedtech.com>
References: <20250604125558.1614523-1-jammy_huang@aspeedtech.com>
 <20250604125558.1614523-2-jammy_huang@aspeedtech.com>
Message-Id: <174904774987.4021667.10220150728052993146.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_073553_301883_43BDD3E1 
X-CRM114-Status: GOOD (  10.35  )
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


On Wed, 04 Jun 2025 20:55:57 +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../mailbox/aspeed,ast2700-mailbox.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.example.dtb: mailbox@12c1c200 (aspeed,ast2700-mailbox): reg: [[0, 314688000], [0, 512]] is too long
	from schema $id: http://devicetree.org/schemas/mailbox/aspeed,ast2700-mailbox.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250604125558.1614523-2-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


