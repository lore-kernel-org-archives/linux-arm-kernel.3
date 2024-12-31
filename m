Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3BCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 08:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S86szIjCK98MypQVuJQnerUhRjNImMv7jU4YUxdD98g=; b=yjOMioI1zblaSQ8rI8peQCOvpG
	Y2ccDgj0eN+k8yPSOF/lK1lDOuewyA5SxEGvT1G23OODPmlRvpqFHtv5ISFfke8KNWiNWJhbV1MJm
	zviyYs74x6f17OBvYfJ+XqIqiXZjUaXHXjJMaDakjpRWFNTN7ocCvFkcAhwTipGlHHPHiPtc8ToyU
	04EDI0jwqp5eURaZ29ZmjjPvBOoLjaf+UmG1+Rgx4KP+PjrgZY9Fn5xfSKD0dVflCfS2RNEMYzaAj
	MKakSHkPq1aaDA3A5/YubGXSvFbld/whl85KGr84DwPLkeTn6aggf/yKc983Ec1NbmezZXlSevKnJ
	HYV//r8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXce-00000006pLJ-3gvd;
	Tue, 31 Dec 2024 08:29:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXaz-00000006p3w-1xRo;
	Tue, 31 Dec 2024 08:27:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49A4D5C5A00;
	Tue, 31 Dec 2024 08:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9800AC4CED6;
	Tue, 31 Dec 2024 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735633640;
	bh=7dMKvb0VzM45X+Diev04KcZdImkN8+DaAtfIWIBVlfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bs7F/8y9eqcrDElleyJUV5huGjXwKC4uv46mKq+8LmkjDFhIwpd6c7voh+t3hao4U
	 fjvz89apgRyeriA49YajwyP5kgP9bPbXGAb6/8m8KkpZgVed/qO6Sw1kWxiQDQScm9
	 OXeQs14OTP5wN26C6nF2ju7DLEcZyZM9oLUy8vP85s9LjLnOAzqY/955W4tI7hk2Wq
	 8TvEIyskjPp0qzrqjAvLN2df0ZasJNK6Y4kgrMvfwHc4LkmuzC08H7Mx+t9IrWurMh
	 AchYD2Q/xvEYQT0Osi3/8uJyoJfeCqndxRTawKgMUwCU2kKVueFaWwbF/VUHhKr4C2
	 C3OT348bBwu7g==
Date: Tue, 31 Dec 2024 09:27:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Karl.Li" <karl.li@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Chungying Lu <chungying.lu@mediatek.com>, Chien-Chih Tseng <Chien-Chih.Tseng@mediatek.com>, 
	Andy Teng <Andy.Teng@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: mediatek: Add apu-mailbox
 dt-bindings
Message-ID: <vsdkjbedy5zm6iz6jtjgoynove2u6tgd4al3b6v5xzvrr3twm6@cmy6poq3le53>
References: <20241230034446.1195728-1-karl.li@mediatek.com>
 <20241230034446.1195728-2-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241230034446.1195728-2-karl.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_002721_547631_FD8A06D7 
X-CRM114-Status: GOOD (  13.58  )
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

On Mon, Dec 30, 2024 at 11:43:35AM +0800, Karl.Li wrote:
> From: Karl Li <karl.li@mediatek.com>
> 
> Add devicetree binding for apu-mailbox.

A nit, subject: drop second/last, redundant "dt-bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

I already asked for this.

> 
> MediaTek APU (AI Processing Unit) is a microcontroller unit
> designed for AI acceleration tasks. The MediaTek APU-Mailbox
> facilitates communication with the APU microcontroller.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597




> 
> Signed-off-by: Karl Li <karl.li@mediatek.com>
> ---
>  .../mailbox/mediatek,apu-mailbox.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
> new file mode 100644
> index 000000000000..fdb0dec5fb78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml


Use compatible as filename.


Best regards,
Krzysztof


