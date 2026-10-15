Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C636CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PdCABJ02UEmwfes7qBJeAq3DKKkIaoZlycMlEcT4GQ=; b=v3eX08fu67pSpI7BMoxEwoFEwp
	rwj314lgf2LYcrwQ+kFbIP3LlVKdVCTtKY/pt0MhXf2XcauPIkqjpGJjh6odzpmYwe4cfYX0mjUtM
	ftTIz1VnYQ1MToq9zFGgyqadndTjkZb8GL55LonNZyp5J0C1284nVl3C2RrzafBKhtmVFMqYHDqaw
	5CQ5MnT4a5R+hhoOEuyFtHx1JVb9LyNzvX3yukmemJO2cBSSIdbXCwMyE7VgmvLhMdxKbXAHulKER
	0SHGavNA9lwWJ2h1Cb+HisGKZ5iStfE2HOBlqYRKablLnJkzn3QsbaG/iM82lDrQ+w9lva0SnhWXW
	792BavVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI62-0000000HL4A-0RM9;
	Thu, 15 Oct 2026 09:49:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI60-0000000HL3F-2pvb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:49:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EE16447BC;
	Thu, 15 Oct 2026 09:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233B21F000C6;
	Thu, 15 Oct 2026 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057796;
	bh=5PdCABJ02UEmwfes7qBJeAq3DKKkIaoZlycMlEcT4GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jQgQPj/ZjFMZM4uyFl0mFkxraZP3JYZwWge9ZIamXvMhHNeXud5J+qHuAo7XtCYbG
	 4oX6UVprcNldwkS85/6FoQZBadxP867J2YvC0XwvzEBhOQQBIPCHxr4tgmKYKW5fc5
	 q/TQGl5UpwUHgBCLMmgNaftljAgtK/hCIAjBocdeOMVckzV8rMq9whCgXVaCtIzLcM
	 Czr67UxyZO7WhAJKI6ZwB/9U0+c/OEf/ev0msuQ+TcbnMWwHFasjmuPaJogFkFPQR9
	 XqFA8MzjUHD1XmD7IrGGh/lwTSjJm8xkfJaoIq9YY9hbl14fU2lpFnPqoZhDDVflo7
	 As9MLVH/pZNOA==
Date: Thu, 15 Oct 2026 11:49:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Subject: Re: [PATCH 5/6] dt-bindings: remoteproc: Add RPMsg resources to AMD
 BRAM rproc
Message-ID: <20261015-ethereal-cicada-of-perspective-c1aaca@quoll>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-6-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014213426.2957480-6-ben.levinsky@amd.com>
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

On Wed, Oct 14, 2026 at 02:34:25PM -0700, Ben Levinsky wrote:
> Describe the optional mailbox channels and named reserved-memory
> regions used for RPMsg communication with a BRAM-based MicroBlaze
> remote processor.
> 
> The three named memory regions provide the two virtio vrings and the
> shared RPMsg buffer pool. Firmware and its loaded resource table remain
> in the executable BRAM described by reg.
> 
> Assisted-by: LLM sparse

How sparse can assist here?

> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/remoteproc/amd,bram-rproc.yaml   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> index c0359f447ea8..daff8e615ab6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> @@ -84,6 +84,33 @@ properties:
>      description:
>        GPIO specifier controlling the soft-core reset input.
>  
> +  mboxes:
> +    maxItems: 2
> +
> +  mbox-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  memory-region:
> +    maxItems: 3
> +
> +  memory-region-names:
> +    items:
> +      - const: vdev0vring0
> +      - const: vdev0vring1
> +      - const: vdev0buffer
> +
> +dependentRequired:
> +  mboxes:
> +    - mbox-names
> +  mbox-names:
> +    - mboxes

Why do you add this? Please instruct your LLM to actually understand and
learn dtschema.

Best regards,
Krzysztof


