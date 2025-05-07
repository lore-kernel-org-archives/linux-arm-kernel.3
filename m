Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6547BC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KP4IRqzZPQ29d4QUdzb6gQmzKeE1VENgHqOAc6sytrU=; b=iTiJMQGm752dp4ZI4tmMMZNLOc
	fsDStsnrMF300Q7GD88kxLCgark8uXpFU9/ObLkMINt3oGXZDIBYgOKWIPVmWIvwCrS2QHQo1EHqz
	ZQ/QWExCOnTgHuQTUgZzPwbijKAgywgmzTTPoN2p0zwBAYtTC9Pp/PnHwCtgN5jSaAfMs/D63XnCX
	pcAXK6kCg3l0iluQyqmqp9ubUz5wIVUef444lP3BXhlwaHXfEqqFv8pwth27ckcI4CtWC3aQnL8lv
	9ui372QPMGbohkGeMQqKAbkiUYJmwM4IHxsvpwRlgE65IvVkcTdr2ab0yytDekFJbElopDmYKRpbr
	TcD6U4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbSH-0000000F1Ro-4B60;
	Wed, 07 May 2025 09:52:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCazP-0000000Ew90-1sPZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 09:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E5C85C55AC;
	Wed,  7 May 2025 09:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA74C4CEE7;
	Wed,  7 May 2025 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746609774;
	bh=yNe/yghsog/b5Puwx6JCvObC6eqIzd/4ueq2VaAB2yU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n9k+UWsugyDH/IF579694s5FyZt8jd6vyF0dbaGZ3G41pVvUE0jqAgUCuoaXdK+Of
	 BWR8HRi5W9FHaMdDxYZHZ0uJWnFsL6qUgeWVuvfbTXZv5uEBRaKuJRfMOP5ihZHtLc
	 v9GvG+ES3VDQI73i9//Rlc6o1nNSgnuN0thWlVEWoM/dQWNE9GbUF5ONA+f+QVvdfM
	 Ih11WnnRaYooheZbMHVSeSu8j7wOhca06kOmriCjJl4jTBPrDoAPnEEePEzvxrwD33
	 sINnLw5lyivWCX/3okKLrmuwrkn9KUi/pwNf0KMU15lhHFofVNVGAwSgXVs+CARSVH
	 TKZCzywJk75YA==
Message-ID: <7b344f05-70b6-4c59-9b5f-611dde59c09b@kernel.org>
Date: Wed, 7 May 2025 11:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/4] firewall: Always expose firewall prototype
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250507-upstream_ospi_v6-v13-0-32290b21419a@foss.st.com>
 <20250507-upstream_ospi_v6-v13-1-32290b21419a@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250507-upstream_ospi_v6-v13-1-32290b21419a@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_022255_577474_FEF160B0 
X-CRM114-Status: GOOD (  17.49  )
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

On 07/05/2025 09:25, Patrice Chotard wrote:
> In case CONFIG_STM32_FIREWALL is not set, prototype are not visible
> which leads to following errors when enabling, for example, COMPILE_TEST
> and STM32_OMM:
> 
> stm32_firewall_device.h:117:5: error: no previous prototype for
> ‘stm32_firewall_get_firewall’ [-Werror=missing-prototypes]
>   117 | int stm32_firewall_get_firewall(struct device_node *np, struct
> stm32_firewall *firewall,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/bus/stm32_firewall_device.h:123:5:
> error: no previous prototype for ‘stm32_firewall_grant_access’
> [-Werror=missing-prototypes]
>   123 | int stm32_firewall_grant_access(struct stm32_firewall *firewall)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/bus/stm32_firewall_device.h:128:6:
> error: no previous prototype for ‘stm32_firewall_release_access’
> [-Werror=missing-prototypes]
>   128 | void stm32_firewall_release_access(struct stm32_firewall *firewall)
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/bus/stm32_firewall_device.h:132:5:
> error: no previous prototype for ‘stm32_firewall_grant_access_by_id’
> [-Werror=missing-prototypes]
>   132 | int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/bus/stm32_firewall_device.h:137:6:
> error: no previous prototype for ‘stm32_firewall_release_access_by_id’
> [-Werror=missing-prototypes]
>   137 | void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Make prototypes always exposed to fix this issue.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  include/linux/bus/stm32_firewall_device.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
> index 5178b72bc920986bb6c55887453d146f382a8e77..ba6ef4468a0a8dfeb3e146ec90502e2f35172edc 100644
> --- a/include/linux/bus/stm32_firewall_device.h
> +++ b/include/linux/bus/stm32_firewall_device.h
> @@ -35,7 +35,6 @@ struct stm32_firewall {
>  	u32 firewall_id;
>  };
>  
> -#if IS_ENABLED(CONFIG_STM32_FIREWALL)
>  /**
>   * stm32_firewall_get_firewall - Get the firewall(s) associated to given device.
>   *				 The firewall controller reference is always the first argument
> @@ -112,6 +111,15 @@ int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsy
>   */
>  void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
>  
> +#if IS_ENABLED(CONFIG_STM32_FIREWALL)
> +
> +extern int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
> +				unsigned int nb_firewall);

That's duplicated with earlier declaration. If you need to duplicate
declarations means your code is not correct. That's not a fix at all and
you are again masking the real problem which I asked to understand and
learn.

This is something solved already in all other common interfaces (ones
with stubs) and it confuses me why here it takes so much time. I'll just
fix it myself and I will apply v11.

Best regards,
Krzysztof

