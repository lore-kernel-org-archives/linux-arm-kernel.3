Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD5DF531C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h57ClK60tsH9oI4DCtdzR36a7IrxmxfNNBkYJTic2WA=; b=VrYyB++COeNVqL9HaZ9QzVUqIo
	XmocdSqbP16NvUNWEMjKFV6mrCBFGoHK0ddZxcviPzaWejZbEDxZ83VFBRBrn8zPO5aTMW/g9GCKh
	F0RejILdCP3eb89Utv9QSJpND8pT9JrH+hs+zYjcc3wygESZq4WcIcYbgIWx9GJUNLZuheAnosy/l
	BZMOeiMv5oeKPyT3yhkxr6vALbrcmdjM92dMc+bNEGdJuIyimng5G7J8Kfa06S1ri68aH2g53DFRU
	cimDZjzbaiLEHeRxX4w/Vko8O3QojPHo2FwGHC9q5QHly5XeKxBu8EkmvzVmRv1nuf/IkQJIlEX9/
	jWHQdLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCN50-0000000GJbH-3OlQ;
	Mon, 13 Apr 2026 19:36:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCN50-0000000GJbB-0AxK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 19:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EC1561852;
	Mon, 13 Apr 2026 19:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E826C2BCB6;
	Mon, 13 Apr 2026 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776108976;
	bh=MO0Ytka59ZQnHYNVwc8gNhlxA933PxFOBNgjc4vISHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KYtm7i8oH6cvvoAP2XrKRqp7Eo45Dn6bQxOF6++q2uSN4i9kdTe3D1knbBKSssiBW
	 Kpme7sAigdZmKsAUb1icVMIQYyCFjklRtfmkohJlyFLGOD5smK4MQATMRFQBZQvHDu
	 Mo4kwI5EUxxTzN3WgaYFt7GuhxX05/zWGhojSbaiPc3xZKROn071MfECnYSh5rJHgj
	 MSNc9fPtleAUcejJW/UCBhT7mW2CUIy48s0LvIhGy9xstE1xu3fIrAvg/uuS2nPfs3
	 Nnmd6g7ALQwjhSbVIFdPjAJ5jFRFKFq1/+Xvjswfi+n8AC6aewWzD+P/TsxbREPFY5
	 qEHPgszMSM8gw==
Message-ID: <1403462a-4426-4c70-ad14-544a7a2fbb12@kernel.org>
Date: Mon, 13 Apr 2026 21:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: apple: fix spelling error
To: Axel Flordal <axel@flordal.net>
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <2338500.vFx2qVVIhK@fedora>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <2338500.vFx2qVVIhK@fedora>
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

On 08.04.26 09:21, Axel Flordal wrote:
> Change "configiguration" to "configuration".
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Axel Flordal <axel@flordal.net>
> ---
> Original patch: https://lore.kernel.org/asahi/CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_5seuj1Qeh2_1dt994iCJSA@mail.gmail.com/T/#t
> If this is unwanted I of course won't send again.

No, this is perfectly fine. I just totally missed the patch, sorry about 
that.
I'm going to pick it up after the merge window since it doesn't fix an 
urgent bug!



Sven




