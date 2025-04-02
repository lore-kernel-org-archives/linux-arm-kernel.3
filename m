Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388F7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 06:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83q132qo5a6rQOj497C4sAeN568nZ4MnD0R7a14tJyI=; b=lESgxUEx/STrc39Qqwhqq0B0wy
	dPLP8mp9YQjZXxSoMXNG4JfS0fIL/DA99zUFnnhI9UH/NTZ4T8MEaP7ykCXcwIDk7uNUBkwOZ6Uui
	zmxmeJeXTR7LxMmdLoNa+ZYjlGrKGuo9u81a+YGtmbJcdgxY6pxCTpb35h1olaqpCERnrOKSE2IYI
	CWsoHgMD7hG1c1cLM3whvRH4pvSc+3qkxRvAHi/wR9DUAcE4UejtOFSmJMpHHL7gtlo0+fgih5q4O
	Uqeo4b0JDune4bw1mrv9eABqhVN54VAXpX4OIEDgksXsFnCF8M2Gkxz4WV07b8QwpJbg4tQ04ZM6q
	nlOqW4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrwo-00000005HrN-1AZF;
	Wed, 02 Apr 2025 06:51:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrtb-00000005HUg-1MD6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 06:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A59D261145;
	Wed,  2 Apr 2025 06:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39574C4CEDD;
	Wed,  2 Apr 2025 06:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743576498;
	bh=E1bV+ZSAUuEQxNhPyLIPtvTt5fbU6mA00CBvGzT+XXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvagkUC67o2ypNjUUh+4D2kPj9fGjt+0nISzb3fMqrUvA9z/rYl1hikGj7RhwIcqI
	 yFlqDmikkd27f5hKYORYnpXqizAUN+gQ07VimUCux7O36KkCVeCpZilDUvVvWAuNna
	 A7z6NWDYhzxnw2bdHK/Ju+wrEGIC42ykOb5mGq3rZ/ruhMaE+qYBI35cGeppxwDCVO
	 4+0MzhpuVs4JskxVf7wiuja4hKQ+Llvmr2SxzM6fm+urYpNtDbDMz86vJDNx+L+uc7
	 Es9bi1JXfZz20Jw4dcX32e8yqrL/xqS2Taioni9cZ1ep7AIm3Jkih7sS/jCU2589Sw
	 UStw8qqu989IQ==
Date: Wed, 2 Apr 2025 08:48:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: reset: syscon-reboot: add
 google,gs101-reboot
Message-ID: <20250402-imperial-grasshopper-of-weather-2ff12a@krzk-bin>
References: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
 <20250401-syscon-reboot-reset-mode-v5-1-5b9357442363@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250401-syscon-reboot-reset-mode-v5-1-5b9357442363@linaro.org>
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

On Tue, Apr 01, 2025 at 11:11:02AM +0100, Andr=C3=A9 Draszik wrote:
> GS101 supports a couple different reset types via certain registers in
> the SYSCON register map.
>=20
> Add a compatible for it. When in effect, all register values and offsets
> are implied, hence they shall not be specified in that case.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/power/reset/syscon-reboot.yaml        | 42 +++++++++++++++-=
------
>  1 file changed, 30 insertions(+), 12 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


