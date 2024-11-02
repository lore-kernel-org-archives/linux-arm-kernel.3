Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE1EE677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=du7BYCMIm3VqYMVvTnsW2RjIfpKYt4/805z7w/uUpUY=; b=Z1kcPnjCnanwgxQADTrkbJV1vt
	TTduvPywk8QVOcvuqST0DmEKiTZsbgHhhLuU9sAcULAgOajwiz/auHaDKbvRNNJmW8/+DwdMiHc2H
	+ysllhfzjZtbUrfpZ2HF3+8E5Irn6gS388v7Qmip1roXHEzeMU2u5AFazal9OwgutPk4SjvPy2Gj8
	Qa4HUdp0PM0sgFhJM8ShTqqX5lp2ClNpSdiJ7BEdjNWcIVdWIJFb0cvWrMthc+SPFNaXw/AYf6E0W
	zoCJVh2i/wBI0jtmunK/eJsALxT424V7CnD9fCSzNXz4JdANqMpFimcUzfjdjLYTauJFkQN5Uxad8
	mjO7hiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Drc-00000009kI9-3Zfd;
	Sat, 02 Nov 2024 13:08:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Dlj-00000009jjI-1YQ0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 13:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2159DA400B9;
	Sat,  2 Nov 2024 13:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629DDC4CEC3;
	Sat,  2 Nov 2024 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730552538;
	bh=7W8ecw9iKDX42Va0103cXROcPqELbw7Dq4r9AhyU8iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ummwtIk0fBkH4u2coz36iBA1QCn9LCjkVSO7gJH0ENGGTbenuTWjetU+KP10PHhoL
	 0JYqvCrQoqQKQLEjqwFt1Q8kRVdMtx/+vjOtclDIkz4v9ibt9h1A7CxkaKTfHerDU+
	 7cJAhwp5gI6cW/i/MZCgDs2/LRE81NMmS7nUXB5CLBYnI43odCYednbWnM2JL6ogWZ
	 8KneQKQjQ4SFLpszofmjjVJvHkLqdgm5wdkZ/qeAZKtdgy3jtCAxbVbm0B05E7q9nQ
	 XfFeK1gbIw8kDIqgfc3OXW7AEZtcnZtAn7qmEZgod9ukuK8CEIe16T4USIjtjpLrI3
	 xYLAcC2WSJ0iw==
Date: Sat, 2 Nov 2024 14:02:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Message-ID: <dn3pg3h7fis2hn7pgkw3qwfkvbmf5tezowbkbqp3mzd6jcir6q@fffo2jjwcjgq>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-3-d1a4870a4aed@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-3-d1a4870a4aed@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_060219_492117_98426417 
X-CRM114-Status: UNSURE (   7.62  )
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

On Fri, Nov 01, 2024 at 04:08:15PM +0530, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


