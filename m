Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61BAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 04:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgKGpNBvK9Sk4tCd4YTOHPbSQP0l1EqaEPCcjolW7No=; b=NDe+Ox8b5W84NQ1T6gKOJ/cPDf
	xmigXeAYZXftsyE7WGZ8bD013XlZWWl613D63H7tu7Atjs2MXy3d1ANhpYqhCL1cI6il5Dc54udbe
	fkJqGcNgJMCjef+vP1c4h+qbBfmdpZdt1jrfVTGEMFZJuLwWo0ndM1LeTvoN7l6BHe5trwtrW5vQM
	pRCNZHKhJuJUpORVvm3ucab6m2w24tIFRRJzxcji6Dps60jwYg/npBX74/6i6b6NYhVLGmt6ivqI6
	UU2wx4uoeXGcL68shIMmC2Si7UdhL6Hy0rns6rdOnqd/d9bACOYQc66ianmPJXOHjhoMMQ3Qp8LTh
	qG+h3KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2AM-00000001B32-3mSu;
	Mon, 17 Mar 2025 04:33:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu28g-00000001AlD-2N0W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 04:31:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8E7C5C4CE0;
	Mon, 17 Mar 2025 04:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B52AC4CEEC;
	Mon, 17 Mar 2025 04:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742185904;
	bh=Z0a2dhsGygTnIpjglItX4bKcLEMQVArwLyKFp0XhQ7I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J2Duf+l9JOfm66hAwT4GUElZZFPEiS5aUgZHtsKTCQxxJIYBZ8mmbA4euOKDQZm7d
	 RujhJlwwh5UKJF1upR1yRrDlQ2eH7gzcXkoaNPO9gXQ4pq3NCNaxoeSppCdpm03CBK
	 ksiJhW+a0Pw596ntBQRdv+xffFhcRmyYgdI8k9r016hyjuSEF9MkZyX3wQvDAwZe5Y
	 t0Sg7NyZgFqgJTcg5NI/P+FSI9L7F+PoNxe8gQExzpaELQ/ZfPzrik7viwNv/nH/p0
	 zOwYW3i3m52g+AEs2+GkBu5qo9fE8ttUPJ8rwXF2/lzz0Mq010mYiOT/purkAGt/2A
	 UjsNYgBY5tG1A==
Date: Sun, 16 Mar 2025 23:31:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kuba@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 BMC-SW@aspeedtech.com, conor+dt@kernel.org, ratbert@faraday-tech.com, 
 joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
 pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org, 
 andrew+netdev@lunn.ch, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, davem@davemloft.net
To: Jacky Chou <jacky_chou@aspeedtech.com>
In-Reply-To: <20250317025922.1526937-4-jacky_chou@aspeedtech.com>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
 <20250317025922.1526937-4-jacky_chou@aspeedtech.com>
Message-Id: <174218590293.2844402.7312672269180234107.robh@kernel.org>
Subject: Re: [net-next 3/4] dt-bindings: net: ftgmac100: add rgmii delay
 properties
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_213146_643207_C47F2457 
X-CRM114-Status: GOOD (  12.38  )
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


On Mon, 17 Mar 2025 10:59:21 +0800, Jacky Chou wrote:
> Add tx-internal-delay-ps and rx-internal-delay-ps to
> configure the RGMII delay for MAC. According to
> ethernet-controller.yaml, they use for RGMII TX and RX delay.
> 
> In Aspeed desgin, the RGMII delay is a number of ps as unit to
> set delay, do not use one ps as unit. The values are different
> from each MAC. So, here describes the property values
> as index to configure corresponding scu register.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/net/faraday,ftgmac100.yaml          | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml:71:8: [warning] wrong indentation: expected 6 but found 7 (indentation)
./Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml:78:8: [warning] wrong indentation: expected 6 but found 7 (indentation)
./Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml:119:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250317025922.1526937-4-jacky_chou@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


