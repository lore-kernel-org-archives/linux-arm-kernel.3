Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3583DCC6B01
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SP7iClGP0Ri85xlRd3iU6wF4uFdL7BPimG8lW+Zdgk=; b=yMKbbjqH7QR21iDZ1cbu7P4ACV
	AJQJeLkBu5qKsUvUeGTUzPF69f844xNUp5iNBF5BYwICqpNhOczeWOgCTcLj8MXlV7ip2JX7Yp37H
	EF7lmu3ikNR97Qi6MZYyfIJdipo2HLB5JNQUXXFfbrFp54nZ/nHpom6r6CLusmv58cJE6mi5sLsI7
	IldjiTyN9iaYJFA9hKlqmzRb7IxU15FiYaU4qovkytECRDmQNRF4goMpt+IJCNS+FyM4ZsnpZdV1L
	WCt0SBpXUki6OlB/VycepW2RocPBnR2qJJuKryiudaa1pYVU+1e22U74n74X4puCwzjPwZX+JOLzJ
	zCk8sR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CJG-0000000H1Zv-0jYS;
	Thu, 02 Apr 2026 07:17:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CJE-0000000H1ZO-47Tw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D8666185D;
	Thu,  2 Apr 2026 07:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9B2C2BC9E;
	Thu,  2 Apr 2026 07:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775114263;
	bh=j7EzA/5tsJSk/5VZryXf1o458zlikhC3NnA5f1CNu0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fR0JdB4OftwER5qUImwAEvuPxvOKQgQv2xAfFX+ullczvUqPguUBnzhUWIRuevcLX
	 z5mz2MLvJZobhfFErbkPqFfNBYoB3NW3CBvxapB5fwrlldtoRjPA2dI4Aw13WAa2sK
	 VQOr5xtGSSD0cg4Ayv1oWdpvX0neSpOjCeTg1kpOUsO57yKCuJT3ToxO7UciM/rOAn
	 BV4ZIxvXnTOllNcCIfYifa78OF2ZkIGKkjuL02Icg1X2iQRuDXGeurUNW66jbmmx15
	 +FZn+ahlcilhQ+VtZRT0OF/Ro0vgeJDKRmhjNNVTyKvma4d/bx13XZFDFThG1m1N1o
	 Esxs7Mko9jWIw==
Date: Thu, 2 Apr 2026 09:17:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geetha sowjanya <gakula@marvell.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, 
	will@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: perf: marvell: Document CN20K DDR PMU
Message-ID: <20260402-tentacled-alluring-snail-8c2d7a@quoll>
References: <20260401081640.23740-1-gakula@marvell.com>
 <20260401081640.23740-2-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401081640.23740-2-gakula@marvell.com>
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

On Wed, Apr 01, 2026 at 01:46:39PM +0530, Geetha sowjanya wrote:
> Add a devicetree binding for the Marvell CN20K DDR performance
> monitor block, including the marvell,cn20k-ddr-pmu compatible
> string and the required MMIO reg region.
> 
> Signed-off-by: Geetha sowjanya <gakula@marvell.com>
> ---
>  .../bindings/perf/marvell-cn20k-ddr.yaml      | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml

I forgot:

Filename must match compatible.

Best regards,
Krzysztof


