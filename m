Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F906CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mw/1v6DWO84Q6VsyDvADbQ56UxrWJ3wcu/V91X+tWk=; b=ZRrmVBR4VB1Psm3oQwoYUKbdCv
	df+zQEolJmh34dKe90S8Y7bwLtYrTR2JE3LWOSTG+eIC4xUpIiSwkgfAKvKG4MD6ZX2XSAv1v96me
	ON79nN4oi8lNppFor28YAjuhbCCN+TaUOVO0tue/0jQ4rOHXW2G9GWJW7VRcjcclRgrTNhQcIAHEW
	UDg/9mT9Dxv+IEGw69hwwNAYwnp7z2pZ5dbuEYMJsNvyrLBslxS7TkiJi1J2l5e//Y9cUPjNFLIEh
	C45xrn2f+MmOsYLFHcWqy+TuDxsaNa2NpS4fxUrz34O+i+EkRA4Xa+UoumkuD5GbiAlP+obfMUI6v
	RGCUSYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EBJ-00000008hIC-2goJ;
	Fri, 10 Oct 2025 14:33:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EBI-00000008hHu-3g6V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:33:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 489BD6266E;
	Fri, 10 Oct 2025 14:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E5AC4CEF1;
	Fri, 10 Oct 2025 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106796;
	bh=m2PXNXrLebhFa6++1XBL2y98d/eheP7r5cvfGNR8yVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rudQa4CwjZPlcEyIjZSD/meAC8K/kcQSLFWXk+zb4u95bUz0GkUzdYbVvZxn0i3bP
	 JsHQPldNp8xjCqCXHwe4gn+Yig8oSdETZUtZjXjnS1BykzpxNxjZdrPiI7pbSxeJdD
	 b9kUcTCTcofCNkeoNMS+rFsRqfP83/CvcX+IIbqqFjk6awPJ2d8u0Y8OaqlG/BVfFx
	 wy8TTmZsckSy+RkniV4NZzLz8MP+vXJL5tX5a/u2dihQaIT5VBCMyBlw5h4UgA3Esh
	 wdnWpHqe7EMBbdR9kfTWOE+5HrAB/JjxULpRjeyjwks44VNfm1Hv+MarEzwhPx7NN2
	 exDyON92tAnCw==
Date: Fri, 10 Oct 2025 09:33:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Will McVicker <willmcvicker@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: google,gs101-clock: add power-domains
Message-ID: <176010679359.249518.14445454979945020127.robh@kernel.org>
References: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
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


On Tue, 07 Oct 2025 17:03:10 +0100, André Draszik wrote:
> The CMU can be part of a power domain, so we need to allow the relevant
> property 'power-domains'.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


