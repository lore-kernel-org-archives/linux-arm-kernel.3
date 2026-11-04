Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760EF606D81C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nmJCixI;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XG+KLW43
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pNxgrMHWVSbBxJj3lxfx9KSjiconvC2KNEq5RdZwjAw=; b=2nmJCixIgZHJdT
	YaK0yoPC/T9dqSGZ2tMevSkzlr0OeI6hHLhv9t60Rh/UMKeUuwil2SRR9eSzxFN8cqXxMARccwohs
	f/EuAJsy9T4p2+cgxEzxlsl/0w9xaghDAtOGHUv7joSqb0crMMma1kyp12InniAJYH5m44Cajj7Iz
	KoLr1sWWobG/+jVpeDG2KsZZcI+uRRPCL+GyiVKYmCrwKswQ6RwXretoP5kHipUr3qdP1VK1JeN1m
	Mu/bKMjO7WHwLis4GRdRVA+CUElYz8j7FTvuVCW/kQpuKzuiQvT6QkfSPTgVaUNNUzvOc9TuBbh2r
	WNo5HVhVs/1p38BknoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaaQ-00000005QAA-0b51;
	Wed, 04 Nov 2026 12:59:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaaO-00000005Q90-1xVz;
	Wed, 04 Nov 2026 12:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793797166;
	bh=K8BLkcf/SQbFI3BsLcfZZ5IkoqAFtMgOjn1kywYClq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XG+KLW43Aafh7ugqxgWUYrZVN12y9qQORQ4SP3Jcl93vPJijrwfNKhSSAQMNI2qVG
	 xhwH/OlCGhdhTxSJCzRgSY24/J8p8nYrnwyfJTyDVqW3ZFud8WSqBE41IBWdiC51bn
	 oWohAisBzh+C9Lnw7AEJqt68wZ9WBJLgf0ddjm62oRMIo9ZuzlnIZEK7bSCYKM42S2
	 NC2W9nk94kLMc+E80xofYiN11yBNbvQE+XxZwqgG6IxxP/qrFkCl+JJbjH751W1apd
	 NTZGnHHUJ33JcItd/hYFAPnscV4hxSRwnu7gU7Ay3YppYv1YCk0S30nLlqr3vJiepM
	 U2wHt2ULrdatw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B345A17E0418;
	Wed, 04 Nov 2026 13:59:25 +0100 (CET)
Message-ID: <b01dd5c9-258a-429c-b223-ecb329aa8409@collabora.com>
Date: Wed, 4 Nov 2026 13:59:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045928_685575_6AB59300 
X-CRM114-Status: UNSURE (   6.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 12:33, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


