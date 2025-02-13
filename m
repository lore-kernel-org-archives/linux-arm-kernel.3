Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE68C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5SBHujVb6RtmGbKK+7MgKn+iTLkRwv9ntIAACittIU=; b=rEHHk7m7JkbW1ehn6Mlnni6uL0
	5y+MoAOKIZP3hQwqzzn+iUCZXj2c/B+CPB8+8h3XcBaZMT/xj9FYLiGqQUWFbQmguUX4GtVbQ/VRs
	TNvjrRoznISzJ1WHRPlnakRKOODxlivH1aJVjH664v8N7AF0YjObmlJpkR7Jvhgji/ePA2fDlwcZu
	1AuUMrx+/6jRNKzEIdqPhmNfeDUAWEVDASQNq2i4VtuWQcTO1m/hT4S1XNj6n6Ufkmy1KhTnrU/q/
	4kE2MxecyaSJFkCc1SDjdyvoMAITkZrQo53EtX7YMNXaoOzFI0db8l6RFr/BC3zT9g+m6u7ik2dT/
	DrFi1lnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTzt-0000000A9qP-0Bv7;
	Thu, 13 Feb 2025 07:50:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTyQ-0000000A9Wv-3KzZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE923A41E97;
	Thu, 13 Feb 2025 07:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7596C4CED1;
	Thu, 13 Feb 2025 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739432965;
	bh=2r+iftouz+KNmWMr3hXVKgACN/Hfjh0z0QlWbmjE1h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMluKzxmo91HgIN1XqkBR3AF7NgltciJKCmluuhvjfPw7PanUY4Ka5mozmeVyD5kb
	 XhASNZQV3PF7zlpU4/W9nXn5/2hUbc0y8/yPTLKFbGPWRZe604hrBuY9RSRXb42L4w
	 tATww9srWEdEo/s3xQL0FdCoaUHGzZJBYR58r/eaBEZhz6HohlAuddG5xQR2vUr1+E
	 kMB4mFf0DYXi1IORBjBN1ysHl+A50TxsBym5CV7mYQujhqHGg71oN4/b/8cC3j0b3u
	 ki0MR2Oxvb+rgyz0IFScFso0vcPnscvYFgF/xV9AjcdxZTRTKilye+wBn2K1WIdbzm
	 dchmsnZ2sqvVg==
Date: Thu, 13 Feb 2025 08:49:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: eajames@linux.ibm.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250213-loose-positive-moth-be16ab@krzk-bin>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_234926_907654_D50F45C4 
X-CRM114-Status: UNSURE (   6.88  )
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

On Thu, Feb 13, 2025 at 09:53:38AM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


