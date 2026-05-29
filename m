Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00C9CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 22:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHtiwpZ+hr3LQA/M8vOQeknAplJllI+oQpfScdkdaC0=; b=pFi9akElA4IObgAeU9x4+Ex8qv
	a4udjtUhzOVjZFYw+AeDmrf72aiNUpZ56q+v7STLe4xTql2r4hJintD30UIaJYqpIcr0TQbHiNPdB
	R9q7uZWtQN4TeTInbqReQOs31JnqXnIun2nrrS9dmz0jj5ZeY5pR1BXJostGIEICnZdPVKAxy7+zB
	AoKEu8Qw9URv84bjRfh7CuO6+Kr1JyQGY1NzvRAy9nAakQv5Q00dBUBtg8E/jp8DWrCI9VAsCYVFo
	h5mQykNiz4vZTjeL3tc46B+EQz+eS42FdryCsifTz+YvN+fj7uztKH7YqXvxC0pBMUklU5paBoKJI
	wbXiX2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT69C-00000008I04-0kiq;
	Fri, 29 May 2026 22:57:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT69B-00000008Hzy-1Ehi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 22:57:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6660960103;
	Fri, 29 May 2026 22:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774D91F00893;
	Fri, 29 May 2026 22:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780095464;
	bh=qHtiwpZ+hr3LQA/M8vOQeknAplJllI+oQpfScdkdaC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MTfZDkmdKifsvJxS5issxaPsSpVdp3atWttJuQnh042nP/CAAxDPs3AXYF5CXQZM7
	 GXnWIfnLV4oloyJK2Y+f86OdMUOackqzoQL5ogAGfanY2/It1c65Bm7mqS3b6/uwjx
	 kRA3bFPJ7vHRBg+VvL05VeR/pYNky/n4evRZFGH89b1yBFVvn7BFw71fJrSOyHzkPX
	 sCaTe+eE6brH4k40UNjqzwCenhZyrO5McjZRh64s9WejW63BejWSjGvMy6TC6xTptb
	 X6Q1LValvWGpKM5GI5N+lS+QR2MoSLeb6pn4UPvoyLelgFeYWKyEoC6eJX+icoQJat
	 Mr6g6cZx3vWPQ==
Message-ID: <73364628-5345-4c6d-ab18-7aee6c5b579d@kernel.org>
Date: Fri, 29 May 2026 23:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add
 DT overlay
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
 <178000731452.4557.8537369407478321842.b4-reply@b4>
 <oiPZ6ZMRghpGaIEC7KqUDt7QZQT8w5gq0OMZzopCPkcqKOBXXVrP7-t6ZL4LY4ErAN_z1Z4tCdqn7xbxE5EE7w==@protonmail.internalid>
 <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29/05/2026 18:30, Nihal Kumar Gupta wrote:
> Happy to rename to shikra-cqm-cqs-evk-imx577-camera if that makes the
> shared scope clearer - open to suggestions.

That would sufficiently pick the nit for me.

---
bod

