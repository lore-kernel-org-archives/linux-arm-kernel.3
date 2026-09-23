Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB60C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXbSGsIQhnYrKzjXbGFYKzBLzFjvGzG09DHmjM/EATA=; b=PLhj9Xv2V55WvdqNsVG82RbM82
	pFBHnOooOcHE0GII2QbR58BZucow5HondM4XdcUqJ7TuiVj7/6H+gSJWrOceKLYRNRxTVqi9LQrbj
	7RzubfuJaar0CeBphFj5fVZf8uUS0GY5ig+oMpyML3wr2WdxOMEEhNz5hSXubuxmKQvtcJb1P2WbH
	nWkMsOmtgoYcGqTjmppLuXD5ZPvNajOu8V1pSkl2sc+S+Ap8JCHK7sIlK5J6VVE4fnzpSdItnnLJZ
	3vEMkVebfLxT2sMboOzdUTQcxnoohmHGHCZjs3dfN331QewZbyj/u19NVS/mLdXouJF1h0Ann8R6w
	W/A9W/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IXy-00000007ZAW-1ddI;
	Wed, 23 Sep 2026 08:41:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IXw-00000007Z9Y-0gmf;
	Wed, 23 Sep 2026 08:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790152901;
	bh=kX7iAJmyO1bpwYb9DvfVL8/FEwVM8F0j/LnFmfaVzfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CLbDwQrsmHZlSe9YtZAqw5iEfdQV50RBuBtDTODU9KZDn7ZTbkKDblU27B+7o8Qg7
	 FyGJ1MSGJBNqhiKIIawa2c3dHM0OMxLxCrtrSlIqc7yCR2idaEZzXtt3NWNUDIMy6X
	 F0+0+6OdoTifPeq+93kTxhC35vmyoRZZSxk9NNpgiaV5a5F/zlv+BrbS0IJ+g03wx8
	 nS8B8kTe69po8si22A5IqAuh5BJ1ZUQZf7pvARJ4ZjC0vpY/rlW53pX594jx9tH3Tq
	 BMq5QgGroEmQZxZqWKZX1pg5A48vlcYYBE7qRerErMqYoUJypM5hxa5xWMiTMs2e2K
	 lwH5dfiU2S9Gw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E1D8B17E020C;
	Wed, 23 Sep 2026 10:41:40 +0200 (CEST)
Message-ID: <452ebde8-d2e8-467e-8121-69c96d7dd0e5@collabora.com>
Date: Wed, 23 Sep 2026 10:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: Fix MT6797 pin nodes
To: "Rob Herring (Arm)" <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andy Teng <andy.teng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260922222439.1682749-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922222439.1682749-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_014144_791358_50A83109 
X-CRM114-Status: UNSURE (   5.89  )
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

On 9/23/26 00:24, Rob Herring (Arm) wrote:
> Allow MT6797 pinctrl state nodes named *-pins directly under the
> pinctrl controller. The existing mt6797.dtsi uses nodes such as
> i2c0-pins and uart0-pins, each with pins-* child nodes, while the
> conversion only allowed numbered state nodes such as foo-0.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


