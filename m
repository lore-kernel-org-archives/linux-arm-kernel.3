Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70860C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbXkZiQgoCeol6j703bkn3BaF0gN+b66VO3cL6uNuA8=; b=FxHxAVvfOxr8/wOuQuTMZs56hQ
	kUSNkAaTmF/ajyuFBZpQm6aaQn4wmB2QbKI8C/JMYUzIMeLRzKlJSnoctzPKUHfAtuH1BiBXTO/F8
	maY0Y7FQLhTj3qEryWE9o8dbS/OIINQU4ZhJW8/Aic+6lvw0ctJkogB+U75woBkdWP/iymMTcgt1J
	TZeRjX6PvtEKfxufwxk6j0vAL9/S2/rol95h4pO4xtuq36QM3ALq6u7VvUqYF/H1GmMd95iNbcn6N
	RiGVOqXEHCwOgAeoe3z6fU5vnzKt2lJEmmMvwpnrCkvYz0YTesrxRoqJnN27c18Ulax7rHc57l45F
	ENi/aQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w9k-0000000E7Cv-3yUG;
	Thu, 24 Apr 2025 12:58:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uTp-0000000DoPf-0bdI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 11:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SbXkZiQgoCeol6j703bkn3BaF0gN+b66VO3cL6uNuA8=; b=AQ6r/Bh78eHkT6J2ipFQmjt5Vx
	DMxH0JpPh0+8epdUbNqe0yPmvLlq+oFlVLUjjGheRYQUHpKN3FIgaGlM76xxtLfnNn1RYbjzq6gRz
	tWQpfLS9cpxGhdoR9sq/3S0VY3YJgU/WOJzJTI1Lalk4qXc8zwt08rb+og+4Fci0RK5vCYgsCyxP9
	kccNo/I8IehOicI1koZgVxvsOFkowWSyiqtrXAwH0X/6qswt4VzbFDTYU5cw2iVLI3c0WnE9jWSu7
	oqX5pTax4qVJdprwgDMU27j+h7AMHfHUH1oRuravEwJQOxT0O0FLLnxPT8/+tCxX7BPuDZ1nTHsiO
	SFI13fPw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7uTl-0000000BlJL-42af
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:10:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OA0orr005984
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbXkZiQgoCeol6j703bkn3BaF0gN+b66VO3cL6uNuA8=; b=W1sDJeMkeeGJXqJO
	Q0V5h5Wq/x3Mmm87v5ouH/9p2pYIVCjPcN9BVgpehGBCpRNoKUB3AFRE5vYxK4WF
	wHq0pa89xsBaj0XK4s3b+nWqoIjSGU6M7tFrusLwQ9iTcOS2x3cLnC3u3SKd5qcW
	3gUsrgrDI7vNpvcGlCPz+zEzn5ZIJnFXRSBiybIYBE0dMqNq6qeEKG2uqgxWnLbZ
	zoAIM+LDJVPGY7Ibd4TSsZvzk2RaVszqIakZPSW3e8wyDexcmF+zrmumTzzmdZHX
	MCZnOy+uiWySiRZESlo18c19oI7y8kx3BfRgRNve+KkOaWOC+nr/4iXfE4KCLbht
	vLKw8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh05b24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:10:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b94827so141075685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 04:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493035; x=1746097835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbXkZiQgoCeol6j703bkn3BaF0gN+b66VO3cL6uNuA8=;
        b=hGPNjOgWoAuXCs9kyrZ4AiL0ax9qlssf8PK0Id1TvQwn2tCPCe78iYQU8Sj6/gCpoF
         mtdW0fWFLFz1NsBAwNZQOsnXtkRADzy2M/nuz09kI+kg6ZIAUvQmiv1pDZDE686tVqbd
         h1c6SLftY0fmPZxQfYtMIrhNED0RWzMhDEpRtKUzB6UXftTZiSvPaHM8/2wzxM7Sungf
         uEi8BkzJXsnhQosGFg3zdVbfmiFiOHdDjZpvtbnRp4l+FFKxvVP/Sva0V2d+LYZ0kTcW
         my26IhABHxb3AbnV8W2UWldt1FjOT9hXu7oeY5XeX8ElzOZLeplJ7G3E8e8qvX+6cC8/
         VOqg==
X-Forwarded-Encrypted: i=1; AJvYcCVABIHtVfUKNFIw35V0b1qOAG/7dXC4g7a69d8FJ4oKz8uLric7fI8RqboPtZUXpXEqbZtUiuAffVc6Laf5R4sB@lists.infradead.org
X-Gm-Message-State: AOJu0YwyV11/6/Cfaf1l0cw2TAn+NWu18SKvpQ1triUPJcvzpqeq3uNJ
	evS8fkqOemIS9LUklkzM3eXJ3RRI/pLW2L+feRVkiRSYptRiF0zNXsQSMD1ho/at52P/OXREprR
	hzlLjD9uUR/QPwEI76jzG4CdjUa7nyH7S4nAYoSBuSCzq+LgWybIG5pdv1Jl3dvrI28gZDUhPmA
	==
X-Gm-Gg: ASbGncsBuJXnpjF+kSHwwbaaGUMFFhDq7uS+P3slL/OmIzymKac5Xcq+1RpOiaKlX3P
	MtR1GfsiuMl3BStERZGJaGGN3S+KHS0MO4biBNcVypi998N+Af/uLy+//SCbbNeIIejvWXJcuKf
	tuPTPO3ZaNG2R0xtUbyKOFwHRXmO+Fa1faAcinjSNK3qSglb8T6FWz6AENmgZVR0nVQSAg4ge+B
	gebt93vxskVSzySqPgCQYdi2Ahci1m6d4weIF+Z7tl6KETdEXqzPW/si66kdfN0Ku8qjQiXiO2M
	cwqEYd0HNybmKPugScvacE68LKPTa4yNqprzkg1HI2s6MmW3XJmnOwhmYqUjvx289MJUd4j1nMk
	=
X-Received: by 2002:a05:620a:2890:b0:7c0:be39:1a34 with SMTP id af79cd13be357-7c956f32b80mr335217585a.43.1745493035178;
        Thu, 24 Apr 2025 04:10:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEIWSfSeagQCMxeexreJGiDfdJOejTbjRJi9VCGDNZjfVdsS5Ak1Wfu+3rMCEHoHHhMDdWtg==
X-Received: by 2002:a05:620a:2890:b0:7c0:be39:1a34 with SMTP id af79cd13be357-7c956f32b80mr335213485a.43.1745493034794;
        Thu, 24 Apr 2025 04:10:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2627asm202514e87.16.2025.04.24.04.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:10:32 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:10:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
        Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 5/7] dt-bindings: usb: google,cros-ec-typec: Add ports
 for DP altmode
Message-ID: <air5bftw42xfc3ikm3zmcd2u7jwjya3wkqgw6ojjpf3v6q2d4y@djmxtnhzosed>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-6-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416000208.3568635-6-swboyd@chromium.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NSBTYWx0ZWRfX6iiC7m0uKlRw fOjpY4zStSH+PJIGs+JgpK9VM5RxpZdI2YCQs7OJxQJZkZmhcSNLCrcMuFpAS0Z7hxdAPzw/uh4 1tXTeIMWbk11wTPR7JAKauOKaYyqOTgnHeP0tCGjrxLagm4ktwXd06gMOlBBAjLBGwyKapjZ0uQ
 UIzEo2TaEyNnqeHFUtFJgRWiIgpgSAfAUt8x2jNkvkf0TdyJwZR7owr00ymZrijU3Mi/KlXF2dp M5m7uJkU73WGbni9QncxnHh9bjesQXt6Q3EyJIs93L1S+s21Ck9yL67j9ELaEzRHcu1rm9wPuQJ H5IFrq1A1FDIKqfb3EWcNiFXhE4PjI3zqdc3ScSRb+bQTMbmuugWDG6Oo4O7eyfvtw+al2TAZdd
 BBLkq2X6FE/sz0eBRB/RLcF5AGKv5/+vkw8AYoF7AXBR+7KVRIq7TibpOgDIPZwMcw3mY1Gx
X-Proofpoint-GUID: jDj-L-_-vEoHj07-ZNUGFBtu0lRkikWS
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a1c3b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=1XWaLZrsAAAA:8 a=xgO1mOz0IQAmAFag51MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jDj-L-_-vEoHj07-ZNUGFBtu0lRkikWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_121054_378831_C245F650 
X-CRM114-Status: GOOD (  35.36  )
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

On Tue, Apr 15, 2025 at 05:02:05PM -0700, Stephen Boyd wrote:
> Add a DT graph binding to google,cros-ec-typec so that it can combine
> DisplayPort (DP) and USB SuperSpeed (SS) data into a USB type-c endpoint
> that is connected to the usb-c-connector node's SS endpoint. Allow there
> to be multiple 'typec' nodes underneath the EC node so that one DT graph
> exists per DP bridge. The EC is actually controlling TCPCs and redrivers
> that combine the DP and USB signals together so this more accurately
> reflects the hardware design without introducing yet another DT node
> underneath the EC for USB type-c "stuff".
> 
> If the type-c ports are being shared between a single DP controller then
> the ports need to know about each other and determine a policy to drive
> DP to one type-c port or the other. If the type-c ports each have their
> own dedicated DP controller then they're able to operate independently
> and enter/exit DP altmode independently as well. We can't connect the DP
> controller's endpoint to one usb-c-connector port@1 endpoint and the USB
> controller's endpoint to another usb-c-connector port@1 endpoint either
> because the DP muxing case would have DP connected to two
> usb-c-connector endpoints which the graph binding doesn't support.
> 
> Therefore, one typec node is required per the capabilities of the type-c
> port(s) being managed. Add a port to the DisplayPort altmode as well, so
> that we can show the connection between the DP controller and the DP
> altmode. This lets us indicate which type-c ports the DP controller is
> wired to. For example, if DP was connected to ports 0 and 2, while port
> 1 was connected to another DP controller we wouldn't be able to
> implement that without having some other DT property to indicate which
> output ports are connected to the DP endpoint.
> 
> Furthermore, this supports ChromeOS designs like Corsola where a DP
> controller/PHY is split with two lanes going to one connector and the
> other two lanes going to another connector. In this case, we wouldn't
> have the graph binding under the cros-ec-typec node, but we would have
> the graph binding in the DP altmode directly connected to the DP
> controller's two output endpoints.
> 
> Cc: Rob Herring (Arm) <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Acked-by: Lee Jones <lee@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/connector/usb-connector.yaml     |   6 +
>  .../bindings/mfd/google,cros-ec.yaml          |   7 +-
>  .../bindings/usb/google,cros-ec-typec.yaml    | 165 ++++++++++++++++++
>  3 files changed, 175 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 11e40d225b9f..e3d60997c03e 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -179,6 +179,12 @@ properties:
>              $ref: /schemas/types.yaml#/definitions/uint32
>              description: VDO returned by Discover Modes USB PD command.
>  
> +          port:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: OF graph bindings modeling a data bus to the
> +              DisplayPort altmode from the DisplayPort controller. Used when
> +              the altmode switch is part of the port manager.

Well......

> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: OF graph bindings modeling a data bus to the connector, e.g.
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index ac89696fa649..63d506e88abb 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -98,9 +98,6 @@ properties:
>  
>    gpio-controller: true
>  
> -  typec:
> -    $ref: /schemas/usb/google,cros-ec-typec.yaml#
> -
>    ec-pwm:
>      $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
>      deprecated: true
> @@ -163,6 +160,10 @@ patternProperties:
>      type: object
>      $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
>  
> +  "^typec(-[0-9])*$":
> +    type: object
> +    $ref: /schemas/usb/google,cros-ec-typec.yaml#
> +
>  required:
>    - compatible
>  
> diff --git a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> index 3272d0e01f7e..611345bbe884 100644
> --- a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> @@ -26,6 +26,55 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  mux-gpios:
> +    description: GPIOs indicating which way the DisplayPort mux is steered
> +    minItems: 1
> +    maxItems: 3
> +
> +  no-hpd:
> +    description: Indicates this device doesn't signal HPD for DisplayPort
> +    type: boolean
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Port for DisplayPort (DP) data
> +
> +        properties:
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: Input DP port
> +
> +        patternProperties:
> +          '^endpoint@[1-8]$':
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: Output to the usb-c connector's DP altmode
> +
> +        required:
> +          - endpoint@0
> +
> +        anyOf:
> +          - required:
> +              - endpoint@1
> +          - required:
> +              - endpoint@2
> +          - required:
> +              - endpoint@3
> +          - required:
> +              - endpoint@4
> +          - required:
> +              - endpoint@5
> +          - required:
> +              - endpoint@6
> +          - required:
> +              - endpoint@7
> +          - required:
> +              - endpoint@8
> +
>  patternProperties:
>    '^connector@[0-9a-f]+$':
>      $ref: /schemas/connector/usb-connector.yaml#
> @@ -35,10 +84,30 @@ patternProperties:
>  required:
>    - compatible
>  
> +allOf:
> +  - if:
> +      required:
> +        - no-hpd
> +    then:
> +      properties:
> +        ports:
> +          required:
> +            - port@0
> +  - if:
> +      required:
> +        - mux-gpios
> +    then:
> +      properties:
> +        ports:
> +          required:
> +            - port@0
> +
>  additionalProperties: false
>  
>  examples:
>    - |+
> +    #include <dt-bindings/gpio/gpio.h>
> +
>      spi {
>        #address-cells = <1>;
>        #size-cells = <0>;
> @@ -47,6 +116,8 @@ examples:
>          compatible = "google,cros-ec-spi";
>          reg = <0>;
>          interrupts = <35 0>;
> +        #gpio-cells = <2>;
> +        gpio-controller;
>  
>          typec {
>            compatible = "google,cros-ec-typec";
> @@ -54,12 +125,106 @@ examples:
>            #address-cells = <1>;
>            #size-cells = <0>;
>  
> +          mux-gpios = <&cros_ec 42 GPIO_ACTIVE_HIGH>, <&cros_ec 3 GPIO_ACTIVE_HIGH>;
> +
>            connector@0 {
>              compatible = "usb-c-connector";
>              reg = <0>;
>              power-role = "dual";
>              data-role = "dual";
>              try-power-role = "source";
> +
> +            altmodes {
> +              displayport {

Should there be an svid / vdo definition?

> +                port {
> +                  usbc0_dp: endpoint {
> +                    remote-endpoint = <&dp_out0>;
> +                  };

I think this is slightly incorrect. The lanes from the DP mux inside the
EC are routed to the SS part of the USB-C connector. As such...

> +                };
> +              };
> +            };
> +
> +            ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                reg = <0>;
> +                usb_c0_hs: endpoint {
> +                  remote-endpoint = <&usb_hub_dfp3_hs>;
> +                };
> +              };
> +
> +              port@1 {
> +                reg = <1>;
> +                usb_c0_ss: endpoint {
> +                  remote-endpoint = <&usb_hub_dfp3_ss>;
> +                };

This should be more like

              port@1 {
                reg = <1>;
                #address-cells = <1>;
                #size-cells = <0>;

                usb_c0_ss: endpoint@0 {
                  reg = <0>;
                  remote-endpoint = <&usb_hub_dfp3_ss>;
                };

                usbc0_dp: endpoint@1 {
                  reg = <1>;
                  remote-endpoint = <&dp_out0>;
                };
              };

Would it make the driver significantly more complicated?

-- 
With best wishes
Dmitry

