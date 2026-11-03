Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C39606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mXOn5ypR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xb+/PNN2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rHkwO/ehoRHtFtlIGsgdWec2aBhEIACUFFPzSgEDBXU=; b=mXOn5ypRIgUxz/0i7uEzX6SWBH
	fjgi1gdZjJbt5yRQuEwmy/aUjNos2/FC2gl0EIqH82wW+6dZK7gGwJCMmquDou09mzpVgWCkH59gw
	UtPMicMqZiFdoRnrPVaQUfIob5KLIA1FX2hP37av2cOKHjtcC5w1bih0LioMazduVl7mcgy4r8+Qb
	lOjJLaOC8nRM5vPRgJP5IDRxuT1fdKv3Df3wNk9znWF4H3twEGMXs0ruepi5zHlkkQQrxgwqmsSlh
	0VarDEoYExfh91T2Rzuz+0viBKN9Ei6g1WnsG0Wa1HYWCLKEBsuNkGJOaIJYAE5NdKIClKvy+iR2x
	DbNdL66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCsi-00000002Ef4-3Wkl;
	Tue, 03 Nov 2026 11:40:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCsh-00000002Ee6-2onU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:40:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCCC0609F4;
	Tue,  3 Nov 2026 11:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C271F00A15;
	Tue,  3 Nov 2026 11:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706046;
	bh=rHkwO/ehoRHtFtlIGsgdWec2aBhEIACUFFPzSgEDBXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xb+/PNN2A3PXzPdA5kV6OkdJPlgGA5VnLHEUq0A277IG4azvN+aga3fbhe5yeak7g
	 y/RyUz0c5Io2RBapuzSdnFG4K19xcw+pSL7M1jn3KNEeBpB03yRYupFVsOfM86U8XE
	 B+nBvqX5bU/xaAJe5wU+7/atPF04UywRS/x+DoUZ8I94wKEr2yKb5+e92YX/9nX+VK
	 nc3X9KtRQZuD64i+4fQ8CMc6Qu4pzf5lE0zzIs6DOCytgV0+TMg+uPnbZ8KQSyr6AZ
	 lecgRpiV1SKsxTubCU/0UvOByAH+PNdqSiAP23F4feTrkT4Urj+CD/ruhw7CQ+OpXg
	 gXWGdz7Cic8Jg==
Date: Tue, 3 Nov 2026 12:40:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinesh kumar v <dineshkumarv85@gmail.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, s.hauer@pengutronix.de, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	festevam@gmail.com, Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Message-ID: <20261103-bouncy-upbeat-civet-d85994@quoll>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-2-dinesh.v@adlinktech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102102653.272056-2-dinesh.v@adlinktech.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 03:56:51PM +0530, Dinesh kumar v wrote:
> Add the ADLINK Technology Inc. vendor prefix for device tree
> compatible strings used by ADLINK hardware.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Also, mismatched identity/DCO.

> 
> Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index e467da45cd7a..6bbfa5619ee4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -70,6 +70,8 @@ patternProperties:
>      description: ADI Engineering, Inc.
>    "^admatec,.*":
>      description: admatec GmbH
> +  "^adlink,.*":

Honestly, so difficult to put things alphabetically...

Best regards,
Krzysztof


