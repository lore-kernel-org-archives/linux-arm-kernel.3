Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7156C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NWygjzOR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMvkuXyN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=adm3/MIJo3E7WXMIbe6tHjeBdjkUPTriM2gda+HcP44=; b=NWygjzOR4ZWtM7
	SqfwiNqzGrSCwiZrBJjcRYsfvm/BCx6TcVFzb+nc6ZXhDzzTBXRX09Nh9KeaJ81szZocaoYKOvJpL
	IDCOYqNgq4LYqHr+tZ+hV90o7tGLCe1/LR2XXSTasb7Y1GH2vCdaGExZPCPKfPqXu9Ctx39245Qn4
	YKDg3zhJnlyrhQ0ZtE8we0QU3TmsNUB6qLr9xTmwdYSh9t7QU/eqWelZsHvebvVKPUPg3yXXCbD2w
	FZ0ON5ai4C8FXCz8UBmKBGL/yBQDN88v53Z1dW6QbmPJV85tbRHkZGRwHfYx+8CSr3+xvV+bjw+3Z
	0wbVzFrMoBSK5LKIYvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2km-00000006xKN-0pC3;
	Wed, 28 Oct 2026 12:27:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2kk-00000006xKA-33ib;
	Wed, 28 Oct 2026 12:27:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBD8060234;
	Wed, 28 Oct 2026 12:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3541F01828;
	Wed, 28 Oct 2026 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190457;
	bh=adm3/MIJo3E7WXMIbe6tHjeBdjkUPTriM2gda+HcP44=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PMvkuXyN2zRu1HA8JBneaxhXnjx0oT8RzIoiYhv9sdNE4/hTDnTUlFU0UKyQKTJ15
	 Dyyn1pNk5bjeW9vTvr+iC114w+3FpqT9xPePDPjlZuQblqqGaE0zMWrmSbHFWJMto9
	 ChlntmpfAc3ZQXUq+Eb1ObX79UxoDV4uIT7aUr8KsJbh6oxa7jqVWGyvQeyLT46LMd
	 +efaKFiHbyMcxHsVNJaO/6EroPR58qKDIBkUF/Lu13ZXUSflavDEu7HVJyhf9XhA5A
	 ApVQx+0OJKd3AYHugxzi+zQ621dhFzihEvjxgD+WTOnF/A5g33bSebysuQ+hAAPaGB
	 SWHXiFLcZKe5A==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261006102937.10972-1-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
Date: Wed, 28 Oct 2026 17:57:29 +0530
Message-Id: <179319044944.10280.12083829801747357670.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=mani@kernel.org;
 h=from:subject:message-id; bh=OwSPiTEyrIyRUc9GwTlmqHlcVXTglC/I/83i2IzbsUU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4eo0hk2YgvBuZ7r5ewC9IOk/KJFTqel46Jp9j
 Y00DFtI0EeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHqNAAKCRBVnxHm/pHO
 9ThPB/9IjRUjU9za8K+ZBZR+lsZVoZ8zp7laAPEbp5mr16oITGXuX6aps2NOkgAs3TngET/JqLi
 pY7JCeCyJ7NL8LJp9CgKpoUN3JoLoqieEfAjvMSbykamjXqEcSzsNplI4XEO5FO+UguLlEWl/P7
 puslg1vGSCnJUwnvQooSeH8wNewfckkn/+0++bnegV5EPw1Ms76RKOVD+8HpkEIy+dI69UgrN++
 xNAx4KZfP2gYmNHz21rtsE9Y+s8odddJgBt80yDJdoFHTs8J4DTZ2aE7tMBQiTpkWKQkTSPqIj5
 b4q5+r1/Jbe3z4z5KUsIdElHz+AXVU+Z8aKKffHop8B51qIb
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-06 12:29 +0200, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
> 
> Everything was reducted to the dt-bindings to describe the Serdes line.
> 
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)
> 
> Also other unrelated patch are dropped from this series.
> 

Please rebase this series on top of 7.4-rc1 once released and resend.

- Mani



