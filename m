Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9502AEE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+HIIAydeLFjW7pUTKMYG0Hu8J3Sx0A/DervYUmWSt8=; b=vr2AOp0Qai4tyJsXXjM6vVBCH6
	YS/+wWftzoks3jvWEiclFlkFUzkKizcpeM6aRECDXFQD2KSyZQkKhecIHItN8jcllRXghonSayaZR
	/aSKzOU02Mvwnd5laPuR0FZkXOvIxwh1akRP2GgVMVWgH+0D8MTFKxqS1Pf+7IjYsv5DPBht7v5ur
	rr/TOXiRY7uDI/lBtzn3Rt2dDoHxPxBlgPJmQ7ZvOMlEg5KN9872wWl4JOAcEV3cJ9j0tufOONT1P
	R1zCCH6FODsOcapfFQuY9UVycRi/u5I/7nOCVYcOomIgI+0JvaxspBhN7uIYRiZgRhUr2MYdNY5I1
	vX8+NgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valuN-00000005Zdl-3go8;
	Wed, 31 Dec 2025 02:25:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valuL-00000005ZdR-0gbr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66653443B2;
	Wed, 31 Dec 2025 02:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F93C116C6;
	Wed, 31 Dec 2025 02:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767147952;
	bh=tHQ9S/Ivz/LfPTqBZFEnLr38RdRE/dlYpzYs3nse1z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdGGgFZClh2nVp6l3AT5LqKFhdRpWp8h4QNR4p2fmgnIUnunNb/++SvKBNNHBnPKl
	 Fn+yMvxjM1Tt5sYhj8/hthKJnQcF8nynRDqb43T1yUjTwlXRArALigWPV1MblX0Rjn
	 7br+oPvjsqvuE13FA3Ql+6D0lQZIDTaoaL2/4826fmdgbGfGTezNVn/2CwBfq+I9C6
	 v2/UbE0yF1YP0S6rfJXg8EZi9NwWzhHUH42NQLqQEwI3Seb+d2WDbk1Dmn0Z2LA084
	 xwwquYCjJwnfDc3LhW3yB70YjDFD/L35QlPwmSGmZxv2v7wSPkeA1C9XfVZUlRCrIC
	 dNKebNoT4loOA==
Date: Wed, 31 Dec 2025 10:25:45 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Huewe <peterhuewe@gmx.de>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: tpm: Add st,st33tphf2ei2c
Message-ID: <aVSJqQHcvettOKeZ@dragon>
References: <20251230014047.149677-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230014047.149677-1-marek.vasut@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_182553_224152_A2448879 
X-CRM114-Status: UNSURE (   8.33  )
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

On Tue, Dec 30, 2025 at 02:40:34AM +0100, Marek Vasut wrote:
> Add the ST chip st33tphf2ei2c to the supported compatible strings of the
> TPM TIS I2C schema. The chip is compliant with the TCG PC Client TPM
> Profile specification.
> 
> For reference, a databrief is available at:
> https://www.st.com/resource/en/data_brief/st33tphf2ei2c.pdf
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied both, thanks!

