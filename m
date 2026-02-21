Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52F8C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+9Tehwo0qzPuZuoiDXq8/kmosiYPCOysRXntdP318M=; b=D9tKJCP2Q3aFA+N6guV1NF15F8
	e5ShWvClJk/EUh04gHINT5Z752MBiyTq0Hc0W46JSSXsV23ZsaltS04kvZ1G1BK3i506IDFYaku+5
	MBuCcMQfECVwfy240U/yXqp6IUWR+GPiFeprCaWL2988wM9afZhXGws58B1y+CrpSGffA9cjATZ+W
	FM62AprWdMjlJVxcaoUv8ykD5V02Q4FYHiQ6uB6E2E2mGpNumHwWEBsnmC4sP27li8G70hKevrCGr
	0Gspj7s76iFJ7KT++yjLyRlJDdbpFy8JZA+1lh2Zy2lfRAzMZCPifv0kbfKxoci6Hr9Fb2gMgpjDB
	kWQY1SjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkOY-0000000Fz19-2fp8;
	Sat, 21 Feb 2026 10:39:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkOX-0000000Fz0w-0pv5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 10:39:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C27660054;
	Sat, 21 Feb 2026 10:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B105C4CEF7;
	Sat, 21 Feb 2026 10:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771670367;
	bh=ElEiXw/kpfF/9dnsh1MXxAHQqrXO74THYDAahurX/x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmIo8W4zlGFr+fzvZUDgYBl4jYMTqVQFMez7ZTHpqqHzZ1x4ljf/6TDtAEgVoEd6i
	 RzBldJLQB3wkpPfkMRaHtzwDDQyC5Jqe07iafbOPP3s7rzgDQYrMNU7hsGW25WfiJ6
	 PrYJIofFNjZzESLKloIKYYsZUaTY9mZy7zlWcwg4cvYEWnNoWZlcSPPPRef2jvTRz+
	 Kv8JsqxUNHUcC8EjaDXBqqotckluCD9MJEkWCFf8h882j3QUyi8zvSjCY693fTzv9B
	 KUNBWSinXCDbcYGwko97gl5ieicBQrZYT7XuodULLFFU3eLU4hf8ECR4OJG5VaQojn
	 YJ01XxhU+3W2A==
Date: Sat, 21 Feb 2026 11:39:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH 5/5] dt-bindings: iio: adc: xilinx-xadc: convert to YAML
 format
Message-ID: <20260221-refined-sage-coucal-2bb13a@quoll>
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-6-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260220053941.611415-6-sai.krishna.potthuri@amd.com>
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

On Fri, Feb 20, 2026 at 11:09:41AM +0530, Sai Krishna Potthuri wrote:
> Convert the xilinx-xadc.txt Devicetree binding to a YAML schema format
> and remove the old text binding.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  .../bindings/iio/adc/xilinx-xadc.txt          | 141 -------------
>  .../bindings/iio/adc/xilinx-xadc.yaml         | 194 ++++++++++++++++++
>  2 files changed, 194 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml
> 

There is a guide telling you what do we expect from patch touching DT.
Please read it. What does it tell about subject?
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


