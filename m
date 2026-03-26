Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1578A106F2EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkSX6UODjbHxVZRsTFtVUNK0O2A0o70eZhcHMW3iLGE=; b=QMgzRLLn+IDZy8nEiH403COKQx
	glJn7SUDvyAxCbJQ6YxmPVjqOQ/bt3IBbngES07yOHo+rBElupg5iPH3EGyF3yhoFca8DDF8A8FL/
	GWt7fnnGVUFrmQeUL0/1JkO9DcGdzwLBqO2PUnGc7YFIIGFjK07yP+AB2CcHkVwARR6U74zT18I0a
	X1Kmwq5sa8XoTooEIYWdhRrjS6C1IF4niyeT8PDZD+CEqX0vD4QPwDgvNWlSPn+CMkAnwDuRkTlMw
	l8zDSTiC6Wvr+5lmfw93Nf6RnjHUBOB6A296oMEjxIBKvyEn5xRcmMQRKr0E8k8sdW/IU0kgvprne
	bYGFCa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fwC-0000000518f-0evl;
	Thu, 26 Mar 2026 08:19:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fw9-0000000517Y-44fZ;
	Thu, 26 Mar 2026 08:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C6B960121;
	Thu, 26 Mar 2026 08:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37A3C116C6;
	Thu, 26 Mar 2026 08:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774513168;
	bh=j7dEXpshropQggUha1Yhid1uTd6fGFNzT/dBvVT5ZnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWVQGp3OAxEx2usPa1FpmekCldyhV7PnB8HuiIJp20xt7ttCcihLz8Eo+seAkSeav
	 zgMWcwQoW61jIebj2W9FxY/C7Waxt7peP7iL8HrH991e3uRuLDsdbBmwRo0qxUu1fp
	 eLqimMZUaHD3OLKx3+falPd3RdsrbGHQUXbZluRIEvDbQWO0Ai7sXrThbX0r8AVou4
	 KMzqd85XQC+E0tKTkDbhPD7mLsyOlwxuZ3A71SAFB/RpUaqFu8QOc8KRFrkS/XWj4r
	 uoD28h85EqZkYP/11PJqjUyrJ2wFjwZliDGya31jSve24hcO/a6RenYbWXL2j3EgHe
	 bvVfVAreFfauA==
Date: Thu, 26 Mar 2026 09:19:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
	andy@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
Message-ID: <20260326-secret-quartz-booby-3d3e61@quoll>
References: <20260325070618.81955-1-nick@khadas.com>
 <20260325070618.81955-2-nick@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325070618.81955-2-nick@khadas.com>
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

On Wed, Mar 25, 2026 at 03:06:15PM +0800, Nick Xie wrote:
> Add the compatible string for the SARADC (Successive Approximation
> Register ADC) IP block found in the Amlogic Meson S4 SoC.
> 
> There are no known differences between the SARADC on S4 and the one
> on G12A. Therefore, it uses "amlogic,meson-g12a-saradc" as a proper
> specific fallback.
> 
> Also add a comment indicating that "amlogic,meson-saradc" must not be
> used for new devices. It's a made up compatible string that does not
> correspond to a specific hardware generation and is not used to match
> any driver. For old devices we keep it as it's part of the ABI.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


