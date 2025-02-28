Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996D5C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDcPBY5Ozb3Uw7huacINM4SPWw9/OeFZMCXL/S4H1f0=; b=NF6cyEaaa+puPdd8X3X+RT2hoZ
	pGsHxk5pKdLC8KI6GyOBPhxxhyYKw3FdNep0pVFOa1LillsY7d+AGztm7eQFtyJD64jAOj7ws4M8/
	5F0VhiU2OMVeS0ZfMuhoviCv011qj+TiXzsAWGYrjVGrBG5OSpu8LxiC9lt5+K4RPMtpKzPBvn/bb
	m2kXE/UFP8OH0SGIf8PO44n6kyd9CflGsb8bxPx/ib3szU6s2//VGgYadKmPijrCj+OzjYrHecSzD
	0+4dadI2zHRkMQYkaar4dq9CzDLOY0JeTQx2d/WY7KWPw2Khv1T158tWcc/4GvqPV9meGNUHJt5Mi
	FXFtfUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuJt-00000009v5D-2CWK;
	Fri, 28 Feb 2025 06:58:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuEi-00000009uSz-0Lv9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 06:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5C6D5C6545;
	Fri, 28 Feb 2025 06:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE07C4CED6;
	Fri, 28 Feb 2025 06:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740725558;
	bh=lAW4Ch/ovaOLzenLJGsviLOlU7ETO/UXg/mvxPMcYQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oWWz8JWcVeRcmGES2Qi8xitFyba8eqhai2XV8zMVqA53N8kbVlxEa84LZw9DUbyyr
	 Qu644Zj9xFmHG7/LqlrNo/W5kd/hcCbqP7jw9VakRBW0cvwz+le246a18bjyg7NtQw
	 tbIXX30T2ADKuwdIG8cD0Dwh4q198v4CUTfkLc4beXgqbB9Md7+7V18yBc7jhBHqeF
	 2UTe7M2y44+knQSlRi85FqdwIkJhdl6Pnpt3RRVAOp1W/fbKVVMpaE0bA2uguZNiKa
	 zu0S9BEVelv7+xsklqnq/qL0NaFkZsnkztVXC0J2cXcpY/1lvHYnnIrhQCKLYjMrgD
	 ss/8bvPe1s06w==
Message-ID: <d2929546-27de-4893-a611-dd4a3bca1a64@kernel.org>
Date: Fri, 28 Feb 2025 07:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v3 1/3] dt-bindings: reset: Add Armada8K
 reset controller
To: Wilson Ding <dingwei@marvell.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Sanghoon Lee <salee@marvell.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Geethasowjanya Akula <gakula@marvell.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
References: <20250227192536.2426490-1-dingwei@marvell.com>
 <20250227192536.2426490-2-dingwei@marvell.com>
 <174068786548.161165.4348563654300627455.robh@kernel.org>
 <BY3PR18MB467346EB1FA7CEF0A3300350A7CD2@BY3PR18MB4673.namprd18.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <BY3PR18MB467346EB1FA7CEF0A3300350A7CD2@BY3PR18MB4673.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_225240_245620_EA30EC24 
X-CRM114-Status: GOOD (  12.94  )
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

On 27/02/2025 22:58, Wilson Ding wrote:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-
>> ci/linux/Documentation/devicetree/bindings/reset/marvell,armada8k-
>> reset.example.dtb: system-controller@440000: compatible: ['syscon', 'simple-
>> mfd'] is too short
>> 	from schema $id: https://urldefense.proofpoint.com/v2/url?u=http-
>> 3A__devicetree.org_schemas_mfd_syscon-2Dcommon.yaml-
>> 23&d=DwIDaQ&c=nKjWec2b6R0mOyPaz7xtfQ&r=sXDQZu4GyqNVDlFUXakS
>> GJl0Dh81ZIPlU26YS4KHGIA&m=xw0M--
>> 2th9TCt05M0q_c8C0jvg1t4qbuXx9_d3WgCc0HOBpg5_f5E6TjXP_xdcrU&s=3
>> Gdm4ABV10PnYEpAvJXrV9x-TsfBAHIp5KCn60ohngM&e=
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://urldefense.proofpoint.com/v2/url?u=https-
>> 3A__patchwork.ozlabs.org_project_devicetree-
>> 2Dbindings_patch_20250227192536.2426490-2D2-2Ddingwei-
>> 40marvell.com&d=DwIDaQ&c=nKjWec2b6R0mOyPaz7xtfQ&r=sXDQZu4GyqN
>> VDlFUXakSGJl0Dh81ZIPlU26YS4KHGIA&m=xw0M--
>> 2th9TCt05M0q_c8C0jvg1t4qbuXx9_d3WgCc0HOBpg5_f5E6TjXP_xdcrU&s=
>> WJznALBWhejS9hq88jCvZqevaNdN_5-meKfowRfl-bA&e=
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your
>> schema.
> 
> I cannot reproduce the above error with the latest 'yamllint' and 'dt-schema'.
> 
> $ pip3 install dtschema --upgrade
> Requirement already satisfied: dtschema in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (2025.2)
> Requirement already satisfied: ruamel.yaml>0.15.69 in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from dtschema) (0.18.10)
> Requirement already satisfied: jsonschema<4.18,>=4.1.2 in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from dtschema) (4.17.3)
> Requirement already satisfied: rfc3987 in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from dtschema) (1.3.8)
> Requirement already satisfied: pylibfdt in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from dtschema) (1.7.2)
> Requirement already satisfied: attrs>=17.4.0 in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from jsonschema<4.18,>=4.1.2->dtschema) (25.1.0)
> Requirement already satisfied: pyrsistent!=0.17.0,!=0.17.1,!=0.17.2,>=0.14.0 in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from jsonschema<4.18,>=4.1.2->dtschema) (0.20.0)
> Requirement already satisfied: ruamel.yaml.clib>=0.2.7 in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from ruamel.yaml>0.15.69->dtschema) (0.2.12)
> $ pip3 install yamllint
> Requirement already satisfied: yamllint in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (1.35.1)
> Requirement already satisfied: pathspec>=0.5.3 in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from yamllint) (0.12.1)
> Requirement already satisfied: pyyaml in /home/wilson/workspace/repos/external/venv/lib/python3.12/site-packages (from yamllint) (6.0.2)
> $ make dt_binding_check
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   CHKDT   ./Documentation/devicetree/bindings
>   LINT    ./Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/reset/marvell,armada8k-reset.example.dts
>   DTC [C] Documentation/devicetree/bindings/reset/marvell,armada8k-reset.example.dtb
> 

That's a bit odd but anyway warning is correct: you cannot have such
compatibles alone.

Best regards,
Krzysztof

